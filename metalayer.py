#!/usr/bin/env python

import time
import datetime

import fedmsg.config
import fedmsg.meta


if __name__ == '__main__':
    config = fedmsg.config.load_config()
    fedmsg.meta.make_processors(**config)

    start = int(time.mktime(datetime.date(2015, 1, 1).timetuple()))
    end = int(time.mktime(datetime.date(2016, 1, 1).timetuple()))

    kwargs = dict(start=start, end=end)

    cmd = "./fedmsg2gource.py --category {category} " + \
        "--start {start} --end {end} " + \
        "> logs/{category}.log"

    for proc in fedmsg.meta.processors[:-1]:
        print cmd.format(category=proc.__name__.lower(), **kwargs)