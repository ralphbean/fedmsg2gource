#!/bin/bash -xve

# Gather data
./fedmsg2gource.py --category git --start 1420088400 --end 1451624400 > logs/2015-git.log
./fedmsg2gource.py --category wiki --start 1420088400 --end 1451624400 > logs/2015-wiki.log
./fedmsg2gource.py --category copr --start 1420088400 --end 1451624400 > logs/2015-copr.log
./fedmsg2gource.py --category anitya --start 1420088400 --end 1451624400 > logs/2015-anitya.log
# ./fedmsg2gource.py --category mirrormanager --start 1420088400 --end 1451624400 > logs/2015-mirrormanager.log
./fedmsg2gource.py --category pungi --start 1420088400 --end 1451624400 > logs/2015-pungi.log
./fedmsg2gource.py --category ansible --start 1420088400 --end 1451624400 > logs/2015-ansible.log
./fedmsg2gource.py --category fedoratagger --start 1420088400 --end 1451624400 > logs/2015-fedoratagger.log
./fedmsg2gource.py --category pkgdb --start 1420088400 --end 1451624400 > logs/2015-pkgdb.log
# ./fedmsg2gource.py --category summershum --start 1420088400 --end 1451624400 > logs/2015-summershum.log
./fedmsg2gource.py --category nuancier --start 1420088400 --end 1451624400 > logs/2015-nuancier.log
./fedmsg2gource.py --category releng --start 1420088400 --end 1451624400 > logs/2015-releng.log
./fedmsg2gource.py --category mailman --start 1420088400 --end 1451624400 > logs/2015-mailman.log
./fedmsg2gource.py --category autocloud --start 1420088400 --end 1451624400 > logs/2015-autocloud.log
./fedmsg2gource.py --category fedbadges --start 1420088400 --end 1451624400 > logs/2015-fedbadges.log
./fedmsg2gource.py --category fmn --start 1420088400 --end 1451624400 > logs/2015-fmn.log
./fedmsg2gource.py --category koschei --start 1420088400 --end 1451624400 > logs/2015-koschei.log
./fedmsg2gource.py --category compose --start 1420088400 --end 1451624400 > logs/2015-compose.log
./fedmsg2gource.py --category fedimg --start 1420088400 --end 1451624400 > logs/2015-fedimg.log
./fedmsg2gource.py --category jenkins --start 1420088400 --end 1451624400 > logs/2015-jenkins.log
./fedmsg2gource.py --category irc --start 1420088400 --end 1451624400 > logs/2015-irc.log
# ./fedmsg2gource.py --category datanommer --start 1420088400 --end 1451624400 > logs/2015-datanommer.log
# ./fedmsg2gource.py --category zanata --start 1420088400 --end 1451624400 > logs/2015-zanata.log
./fedmsg2gource.py --category fas --start 1420088400 --end 1451624400 > logs/2015-fas.log
./fedmsg2gource.py --category buildsys --start 1420088400 --end 1451624400 > logs/2015-buildsys.log
./fedmsg2gource.py --category askbot --start 1420088400 --end 1451624400 > logs/2015-askbot.log
./fedmsg2gource.py --category pagure --start 1420088400 --end 1451624400 > logs/2015-pagure.log
./fedmsg2gource.py --category bodhi --start 1420088400 --end 1451624400 > logs/2015-bodhi.log
./fedmsg2gource.py --category mdapi --start 1420088400 --end 1451624400 > logs/2015-mdapi.log
./fedmsg2gource.py --category taskotron --start 1420088400 --end 1451624400 > logs/2015-taskotron.log
./fedmsg2gource.py --category nagios --start 1420088400 --end 1451624400 > logs/2015-nagios.log
# ./fedmsg2gource.py --category faf --start 1420088400 --end 1451624400 > logs/2015-faf.log
./fedmsg2gource.py --category kerneltest --start 1420088400 --end 1451624400 > logs/2015-kerneltest.log
./fedmsg2gource.py --category github --start 1420088400 --end 1451624400 > logs/2015-github.log
./fedmsg2gource.py --category trac --start 1420088400 --end 1451624400 > logs/2015-trac.log
./fedmsg2gource.py --category meetbot --start 1420088400 --end 1451624400 > logs/2015-meetbot.log
./fedmsg2gource.py --category fedora_elections --start 1420088400 --end 1451624400 > logs/2015-fedora_elections.log
./fedmsg2gource.py --category planet --start 1420088400 --end 1451624400 > logs/2015-planet.log
./fedmsg2gource.py --category bugzilla --start 1420088400 --end 1451624400 > logs/2015-bugzilla.log
./fedmsg2gource.py --category fedocal --start 1420088400 --end 1451624400 > logs/2015-fedocal.log
./fedmsg2gource.py --category infragit --start 1420088400 --end 1451624400 > logs/2015-infragit.log
./fedmsg2gource.py --category hotness --start 1420088400 --end 1451624400 > logs/2015-hotness.log
# ./fedmsg2gource.py --category announce --start 1420088400 --end 1451624400 > logs/2015-announce.log
# ./fedmsg2gource.py --category logger --start 1420088400 --end 1451624400 > logs/2015-logger.log


# Visualize it
cat logs/2015-git.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora version control system (Package Commits)' -o ppm/2015-git.ppm -
cat logs/2015-wiki.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora Wiki (Wiki Edits)' -o ppm/2015-wiki.ppm -
cat logs/2015-copr.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Cool Other Package Repositories system (Extra Repository Updates)' -o ppm/2015-copr.ppm -
cat logs/2015-anitya.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Upstream Release Monitoring (Upstream Releases)' -o ppm/2015-anitya.ppm -
# cat logs/2015-mirrormanager.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Mirror Manager activity (Mirror Updates)' -o ppm/2015-mirrormanager.ppm -
cat logs/2015-pungi.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Fedora Release Engineering (Composes)' -o ppm/2015-pungi.ppm -
cat logs/2015-ansible.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Fedora Infrastructure Ansible Runs (Ansible Runs)' -o ppm/2015-ansible.ppm -
cat logs/2015-fedoratagger.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora package labeller/tagger (Package Tag Votes)' -o ppm/2015-fedoratagger.ppm -
cat logs/2015-pkgdb.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora Package DB (Package ACL Updates)' -o ppm/2015-pkgdb.ppm -
# cat logs/2015-summershum.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'a backend tool that extracts hashes of source files (Source File Hashes)' -o ppm/2015-summershum.ppm -
cat logs/2015-nuancier.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the supplemental wallpaper voting system (Wallpaper Elections)' -o ppm/2015-nuancier.ppm -
cat logs/2015-releng.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Fedora Release Engineering (Releng Events)' -o ppm/2015-releng.ppm -
cat logs/2015-mailman.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'mailing list messages (Mailing List Messages)' -o ppm/2015-mailman.ppm -
cat logs/2015-autocloud.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Automated Fedora Cloud Image Testing service (Cloud Image Test)' -o ppm/2015-autocloud.ppm -
cat logs/2015-fedbadges.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora Open Badges System (New Badges)' -o ppm/2015-fedbadges.ppm -
cat logs/2015-fmn.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora Notifications System (Notification Preference Updates)' -o ppm/2015-fmn.ppm -
cat logs/2015-koschei.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Continuous integration for Fedora packages (Watched packages)' -o ppm/2015-koschei.ppm -
cat logs/2015-compose.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Fedora Release Engineering (Composes)' -o ppm/2015-compose.ppm -
cat logs/2015-fedimg.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'The Fedora cloud image service (New cloud image upload)' -o ppm/2015-fedimg.ppm -
cat logs/2015-jenkins.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Jenkins CI system (Jenkins build status)' -o ppm/2015-jenkins.ppm -
cat logs/2015-irc.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'IRC Karma (IRC Karma)' -o ppm/2015-irc.ppm -
# cat logs/2015-datanommer.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Exceptional Datanommer Events (Datanommer Events)' -o ppm/2015-datanommer.ppm -
# cat logs/2015-zanata.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'translation events (Translation Events)' -o ppm/2015-zanata.ppm -
cat logs/2015-fas.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora Account System (Account Changes)' -o ppm/2015-fas.ppm -
cat logs/2015-buildsys.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora build system (Koji Builds)' -o ppm/2015-buildsys.ppm -
cat logs/2015-askbot.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora 'Ask' Forum (Ask Fedora Qs & As)' -o ppm/2015-askbot.ppm -
cat logs/2015-pagure.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Pagure forge (Pagure forge)' -o ppm/2015-pagure.ppm -
cat logs/2015-bodhi.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora update system (Package Updates)' -o ppm/2015-bodhi.ppm -
cat logs/2015-mdapi.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora repository meta-data API (Medata API update)' -o ppm/2015-mdapi.ppm -
cat logs/2015-taskotron.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Framework for automated task execution (Automated task results)' -o ppm/2015-taskotron.ppm -
cat logs/2015-nagios.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Fedora Infra Service Monitoring (Service Outage Alerts)' -o ppm/2015-nagios.ppm -
# cat logs/2015-faf.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'ABRT crash analysis server (New and significant crashes)' -o ppm/2015-faf.ppm -
cat logs/2015-kerneltest.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Kernel Testing Initiative (Kernel Tests)' -o ppm/2015-kerneltest.ppm -
cat logs/2015-github.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Fedora-related Github Repos (Github Events)' -o ppm/2015-github.ppm -
cat logs/2015-trac.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'events from select Fedora Hosted projects (Fedora Hosted Events)' -o ppm/2015-trac.ppm -
cat logs/2015-meetbot.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora IRC bot (IRC Meetings)' -o ppm/2015-meetbot.ppm -
cat logs/2015-fedora_elections.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the fedora voting system (Fedora Elections)' -o ppm/2015-fedora_elections.ppm -
cat logs/2015-planet.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'the Fedora blog aggregator (Blog Posts)' -o ppm/2015-planet.ppm -
cat logs/2015-bugzilla.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Red Hat Bugzilla (Bug Updates)' -o ppm/2015-bugzilla.ppm -
cat logs/2015-fedocal.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'The Fedora Calendaring System (Calendar Events)' -o ppm/2015-fedocal.ppm -
cat logs/2015-infragit.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Fedora Infrastructure repos (Infrastructure Commits)' -o ppm/2015-infragit.ppm -
cat logs/2015-hotness.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'A fedmsg consumer that files bugzilla bugs for upstream releases (Fresh Builds & Bugs)' -o ppm/2015-hotness.ppm -
# cat logs/2015-announce.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'Official Fedora Announcements (Announcements)' -o ppm/2015-announce.ppm -
# cat logs/2015-logger.log | gource -i 10 --user-image-dir ~/.cache/avatars --log-format custom --title 'miscellaneous Fedora Infrastructure shell scripts (System Logs)' -o ppm/2015-logger.ppm -
