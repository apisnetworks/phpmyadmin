#!/bin/bash -i
set -euo pipefail
rpm --quiet -qi jq 2> /dev/null || yum install -y jq
VERSION="$(jq < /var/www/html/phpMyAdmin/package.json -r '.version')"
[[ -z $VERSION ]] && echo "Missing version" && exit 1
rbenv exec gem install --no-rdoc --no-ri fpm
rbenv exec fpm -t rpm --after-upgrade $(pwd)/update.sh -a noarch --rpm-use-file-permissions -s dir -m '<build@apisnetworks.com>' --epoch 4 --iteration 1.apnscp -v $VERSION --license 'GNU General Public License, version 2' -n phpmyadmin -v${VERSION} -s dir -t rpm -x "*/config.inc.php*" -x "/var/lib/phpmyadmin/*" /var/www/html/phpMyAdmin /var/lib/phpmyadmin
