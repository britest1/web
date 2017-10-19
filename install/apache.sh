#!/bin/bash

# Debug mod
set -x;

apt-get update;
apt-get -y install apache2;
apt-get clean;
rm -rf /var/lib/apt/lists/*;

/usr/sbin/a2enmod ssl;
/usr/sbin/a2enmod vhost_alias;
