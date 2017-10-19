#!/bin/bash

# Debug mod
set -x;

apt-get update;
apt-get -y install apache2;
apt-get clean;
rm -rf /var/lib/apt/lists/*;

/usr/sbin/a2enmod ssl;
/usr/sbin/a2enmod vhost_alias;
/usr/sbin/a2dismod php7.1;
/usr/sbin/a2enmod php5.6;
update-alternatives --set php /usr/bin/php5.6;
