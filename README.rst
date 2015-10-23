fedmsg2gource
=============

fedmsg2gource is a CLI tool used to produce a fake git log from the fedmsg
history.  It output strings suitable for consumption by the "gource" tool.

This then lets you make beautiful visualizations areas of Fedora contribution
beyond code contributions.

Requirements
------------

::

    $ sudo dnf install ImageMagick gource fedmsg python-fedmsg-meta-fedora-infrastructure

Usage
-----

::

    $ python fedmsg2gource.py --days 14 > testing.log
    $ cat testing.log | gource -i 10 --user-image-dir ~/.cache/avatars/ --log-format custom - --viewport 1024x730
