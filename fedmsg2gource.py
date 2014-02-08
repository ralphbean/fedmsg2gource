#!/usr/bin/env python
""" Produce a git log from the fedmsg history.

Output strings suitable for consumption by the "gource" tool.

Use this like::

  $ python fedogource.py > my-git-log
  $ cat my-git-log | gource --log-format-custom -

"""

import requests
import fedmsg.meta

import argparse
import datetime
import itertools
import json
import math
import time


config = fedmsg.config.load_config()
fedmsg.meta.make_processors(**config)

# We have 8 colors here and an unknown number of message types.
# (There were 14 message types at the time this code was written).
# Here we build a dict that maps message type names (a.k.a modnames
# or services) to hex colors for usage in the gource graph.  We
# wrap-around that dict if there are more message types than
# there are colors (which there almost certainly are).
procs = [proc.__name__.lower() for proc in fedmsg.meta.processors]
colors = ["FFFFFF", "008F37", "FF680A", "CC4E00",
          "8F0058", "8F7E00", "37008F", "7E008F"]
n_wraps = int(math.ceil(len(procs) / float(len(colors))))
colors = colors * n_wraps
color_lookup = dict(zip(procs, colors))

# After all that color trickiness, here is our formatter we'll use.
def formatter(message):
    proc = fedmsg.meta.msg2processor(message, **config)
    #avatars = fedmsg.meta.msg2avatars(message, **config)
    users = fedmsg.meta.msg2usernames(message, **config)
    objs = fedmsg.meta.msg2objects(message, **config)
    name = proc.__name__.lower()

    lines = []
    for user, obj in itertools.product(users, objs):
        #_cache_avatar(user, avatars[user], cache_directory)
        lines.append("%i|%s|A|%s|%s" % (
            message['timestamp'],
            user,
            name + "/" + obj,
            color_lookup[name],
        ))
    return "\n".join(lines)


def _get_messages(datagrepper_url, days):
    """ Pages through the datagrepper history. """

    start = datetime.datetime.now() - datetime.timedelta(days=days)
    rows_per_page = 100

    def _load_page(page):
        param = {
            'order': 'asc',
            'page': page,
            'start': time.mktime(start.timetuple()),
            'rows_per_page': rows_per_page,
        }

        response = requests.get(datagrepper_url + 'raw/', params=param)
        return json.loads(response.text)

    # Make an initial query just to get the number of pages
    data = _load_page(page=1)
    pages = data['pages']

    for page in range(1, pages+1):
        #log.info("Requesting page %i of %i from datagrepper" % (page, pages))
        data = _load_page(page)
        for message in data['raw_messages']:
            yield message


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", "--days", type=int, default=1,
                        help="Number of days of history")
    return parser.parse_args()


if __name__ == '__main__':
    datagrepper_url = 'https://apps.fedoraproject.org/datagrepper/'
    args = parse_args()
    messages = _get_messages(datagrepper_url, days=args.days)
    for message in messages:
        output = formatter(message)
        if output:
            print output
