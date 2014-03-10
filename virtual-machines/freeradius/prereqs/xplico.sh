#!/bin/sh

## get latest package descriptions
# apt-get update

## generic build deps
# apt-get install -y devscripts build-essential dpkg-dev dh-make debhelper fakeroot

## xplico build deps
# apt-get install -y libpcap-dev sqlite3 libsqlite3-dev libmysqlclient-dev

## xplico runtime deps
# apt-get install -y sox lame tshark python3-all python3-httplib2 apache2 php5-common libapache2-mod-php5 php5-sqlite php5-cli recode sox lame binfmt-support

bash -c 'echo "deb http://repo.xplico.org/ $(lsb_release -s -c) main" >> /etc/apt/sources.list'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 791C25CE
apt-get update
apt-get -y install xplico

update-rc.d xplico defaults
