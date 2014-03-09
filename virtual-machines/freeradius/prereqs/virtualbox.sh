#!/bin/bash -eux

if [ -f .vbox_version ]; then
    mount -o loop VBoxGuestAdditions_$(cat /home/vagrant/.vbox_version).iso /mnt
    yes | sh /mnt/VBoxLinuxAdditions.run
    umount /mnt
    rm VBox*.iso
fi
