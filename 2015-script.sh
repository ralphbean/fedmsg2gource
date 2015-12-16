#!/bin/bash -xve

./fedmsg2gource.py --category git --start 1420088400 --end 1451624400 > logs/2015-git.log
./fedmsg2gource.py --category wiki --start 1420088400 --end 1451624400 > logs/2015-wiki.log
./fedmsg2gource.py --category copr --start 1420088400 --end 1451624400 > logs/2015-copr.log
./fedmsg2gource.py --category anitya --start 1420088400 --end 1451624400 > logs/2015-anitya.log
#./fedmsg2gource.py --category mirrormanager --start 1420088400 --end 1451624400 > logs/2015-mirrormanager.log
#./fedmsg2gource.py --category pungi --start 1420088400 --end 1451624400 > logs/2015-pungi.log
./fedmsg2gource.py --category ansible --start 1420088400 --end 1451624400 > logs/2015-ansible.log
./fedmsg2gource.py --category fedoratagger --start 1420088400 --end 1451624400 > logs/2015-fedoratagger.log
./fedmsg2gource.py --category pkgdb --start 1420088400 --end 1451624400 > logs/2015-pkgdb.log
#./fedmsg2gource.py --category summershum --start 1420088400 --end 1451624400 > logs/2015-summershum.log
./fedmsg2gource.py --category nuancier --start 1420088400 --end 1451624400 > logs/2015-nuancier.log
./fedmsg2gource.py --category releng --start 1420088400 --end 1451624400 > logs/2015-releng.log
./fedmsg2gource.py --category mailman --start 1420088400 --end 1451624400 > logs/2015-mailman.log
./fedmsg2gource.py --category autocloud --start 1420088400 --end 1451624400 > logs/2015-autocloud.log
./fedmsg2gource.py --category fedbadges --start 1420088400 --end 1451624400 > logs/2015-fedbadges.log
./fedmsg2gource.py --category fmn --start 1420088400 --end 1451624400 > logs/2015-fmn.log
#./fedmsg2gource.py --category koschei --start 1420088400 --end 1451624400 > logs/2015-koschei.log
#./fedmsg2gource.py --category compose --start 1420088400 --end 1451624400 > logs/2015-compose.log
./fedmsg2gource.py --category fedimg --start 1420088400 --end 1451624400 > logs/2015-fedimg.log
./fedmsg2gource.py --category jenkins --start 1420088400 --end 1451624400 > logs/2015-jenkins.log
./fedmsg2gource.py --category irc --start 1420088400 --end 1451624400 > logs/2015-irc.log
./fedmsg2gource.py --category datanommer --start 1420088400 --end 1451624400 > logs/2015-datanommer.log
#./fedmsg2gource.py --category zanata --start 1420088400 --end 1451624400 > logs/2015-zanata.log
./fedmsg2gource.py --category fas --start 1420088400 --end 1451624400 > logs/2015-fas.log
./fedmsg2gource.py --category buildsys --start 1420088400 --end 1451624400 > logs/2015-buildsys.log
./fedmsg2gource.py --category askbot --start 1420088400 --end 1451624400 > logs/2015-askbot.log
./fedmsg2gource.py --category pagure --start 1420088400 --end 1451624400 > logs/2015-pagure.log
./fedmsg2gource.py --category bodhi --start 1420088400 --end 1451624400 > logs/2015-bodhi.log
./fedmsg2gource.py --category mdapi --start 1420088400 --end 1451624400 > logs/2015-mdapi.log
./fedmsg2gource.py --category taskotron --start 1420088400 --end 1451624400 > logs/2015-taskotron.log
./fedmsg2gource.py --category nagios --start 1420088400 --end 1451624400 > logs/2015-nagios.log
#./fedmsg2gource.py --category faf --start 1420088400 --end 1451624400 > logs/2015-faf.log
./fedmsg2gource.py --category kerneltest --start 1420088400 --end 1451624400 > logs/2015-kerneltest.log
./fedmsg2gource.py --category github --start 1420088400 --end 1451624400 > logs/2015-github.log
./fedmsg2gource.py --category trac --start 1420088400 --end 1451624400 > logs/2015-trac.log
./fedmsg2gource.py --category meetbot --start 1420088400 --end 1451624400 > logs/2015-meetbot.log
./fedmsg2gource.py --category fedora_elections --start 1420088400 --end 1451624400 > logs/2015-fedora_elections.log
./fedmsg2gource.py --category planet --start 1420088400 --end 1451624400 > logs/2015-planet.log
#./fedmsg2gource.py --category bugzilla --start 1420088400 --end 1451624400 > logs/2015-bugzilla.log
./fedmsg2gource.py --category fedocal --start 1420088400 --end 1451624400 > logs/2015-fedocal.log
./fedmsg2gource.py --category infragit --start 1420088400 --end 1451624400 > logs/2015-infragit.log
./fedmsg2gource.py --category hotness --start 1420088400 --end 1451624400 > logs/2015-hotness.log
#./fedmsg2gource.py --category announce --start 1420088400 --end 1451624400 > logs/2015-announce.log
#./fedmsg2gource.py --category logger --start 1420088400 --end 1451624400 > logs/2015-logger.log


# And the master run
./fedmsg2gource.py --start 1420088400 --end 1451624400 > logs/2015-all.log
