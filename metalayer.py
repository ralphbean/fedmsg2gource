#!/usr/bin/env python

import time
import datetime

import fedmsg.config
import fedmsg.meta

skip = [
    # Garbage
    'logger',
    'announce',
    'datanommer',

    # Not yet deployed
    'zanata',

    # uninteresting, maybe?
    'mirrormanager',
    'summershum',
    'faf',
]

if __name__ == '__main__':
    config = fedmsg.config.load_config()
    fedmsg.meta.make_processors(**config)

    start = int(time.mktime(datetime.date(2015, 1, 1).timetuple()))
    end = int(time.mktime(datetime.date(2016, 1, 1).timetuple()))

    kwargs = dict(start=start, end=end)

    cmd = "./fedmsg2gource.py --category {category} " + \
        "--start {start} --end {end} " + \
        "> logs/2015-{category}.log"

    print "#!/bin/bash -xve"
    print

    print "# Gather data"
    for proc in fedmsg.meta.processors[:-1]:
        category = proc.__name__.lower()
        if category in skip:
            print "#",
        print cmd.format(category=category, **kwargs)

    print
    print
    print "# Visualize it"

    variable_options = {
        'plain': '',
        'without-filenames': '--hide dirnames,filenames',
        'without-dirnames': '--hide dirnames',
    }
    for name, extra_opt in variable_options.items():
        cmd = "gource " + \
            "-i 6 " + \
            "--user-image-dir ~/.cache/avatars " + \
            "--log-format custom " + \
            "--stop-at-end " + \
            "--title '{title}' " + \
            extra_opt + ' ' + \
            "--path ./logs/2015-{category}.log " + \
            "-o - " + \
            "| ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libvpx -b 10000K webm/2015-{category}-{name}.webm"


        for proc in fedmsg.meta.processors[:-1]:
            category = proc.__name__.lower()
            if category in skip:
                print "#",

            title = "%s (%s)" % (proc.__description__, proc.__obj__)
            if 'fedora' not in title.lower():
                title = 'Fedora ' + title

            print cmd.format(category=category, title=title, name=name)
