fedmsg2gource
=============

fedmsg2gource is a CLI tool used to produce a fake git log from the fedmsg
history.  It output strings suitable for consumption by the "gource" tool.

This then lets you make beautiful visualizations of the entire Fedora
community, not just code contributions.

Usage
-----

::

    $ python fedmsg2gource.py --days 14 > testing.log
    $ cat testing.log | gource -i 10 --user-image-dir ~/.cache/avatars/ --log-format custom - --viewport 1024x730
