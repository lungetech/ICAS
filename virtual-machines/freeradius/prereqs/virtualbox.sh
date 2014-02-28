#!/bin/bash -eux

#/etc/init.d/virtualbox-ose-guest-utils stop
#rmmod vboxguest
#apt-get -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils
#apt-get -y install dkms

echo "Building VBOX Additions"
mount -o loop VBoxGuestAdditions_$(cat /home/vagrant/.vbox_version).iso /mnt
yes | sh /mnt/VBoxLinuxAdditions.run
umount /mnt
