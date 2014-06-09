#!/usr/bin/env python
""" Produce a git log from the fedmsg history.

Output strings suitable for consumption by the "gource" tool.

Use this like::

  $ python fedmsg2gource.py > my-git-log
  $ cat my-git-log | gource --log-format-custom -

"""

import requests
import fedmsg.meta

import argparse
import datetime
import hashlib
import itertools
import json
import math
import os
import subprocess
import time
import urllib


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
def formatter(message, cache_directory):
    proc = fedmsg.meta.msg2processor(message, **config)
    users = fedmsg.meta.msg2usernames(message, **config)
    objs = fedmsg.meta.msg2objects(message, **config)
    name = proc.__name__.lower()

    lines = []
    for user, obj in itertools.product(users, objs):
        _cache_avatar(user, cache_directory)
        lines.append(u"%i|%s|A|%s|%s" % (
            message['timestamp'],
            user,
            name + "/" + obj,
            color_lookup[name],
        ))
    return u"\n".join(lines)


def _cache_avatar(username, directory):
    """ Utility to grab avatars from outerspace """

    query = urllib.urlencode({
        's': 64,
        'd': 'mm',
    })

    directory = os.path.expanduser(directory)
    fname = os.path.join(directory, "%s.jpg" % username)

    if os.path.exists(fname):
        # We already have it cached.  Just chill.
        return

    # Make sure we have a place to write it
    if os.path.isdir(directory):
        # We've been here before... that's good.
        pass
    else:
        os.makedirs(directory)

    # Grab it from the net and write to local cache on disk.
    openid = "http://%s.id.fedoraproject.org/" % username
    hash = hashlib.sha256(openid).hexdigest()
    url = "https://seccdn.libravatar.org/avatar/%s?%s" % (hash, query)

    try:
        as_png = fname[:-4] + ".png"
        urllib.urlretrieve(url, as_png)
        subprocess.Popen(["convert", as_png, fname]).communicate()
        os.unlink(as_png)
    except IOError:
        # If we can't talk to gravatar.com, try not to crash.
        pass


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
    parser.add_argument("-c", "--cache-dir",
                        default="~/.cache/avatars",
                        help="Cache directory for avatars")
    parser.add_argument("-u", "--datagrepper-url",
                        default='https://apps.fedoraproject.org/datagrepper/',
                        help="URL for an instance of 'datagrepper'")
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    messages = _get_messages(args.datagrepper_url, days=args.days)
    for message in messages:
        try:
            output = formatter(message, args.cache_dir)
            if output:
                print output.encode('utf-8')
        except Exception:
            # grrrr....
            continue
