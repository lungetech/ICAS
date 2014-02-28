#!/bin/bash -eux

apt-get -y remove linux-headers-$(uname -r) build-essential
apt-get -y autoremove
apt-get -y purge $(dpkg --list |grep '^rc' |awk '{print $2}')
apt-get -y purge $(dpkg --list |egrep 'linux-image-[0-9]' |awk '{print $3,$2}' |sort -nr |tail -n +2 |grep -v $(uname -r) |awk '{ print $2}')
apt-get -y clean

rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.? /var/lib/dhcp/*

echo "pre-up sleep 2" >> /etc/network/interfaces

dd if=/dev/zero of=/tmp/EMPTY bs=1M
rm -f /tmp/EMPTY
sync
