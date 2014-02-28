#!/bin/bash -eux

mount -o loop VBoxGuestAdditions_$(cat /home/vagrant/.vbox_version).iso /mnt
yes | sh /mnt/VBoxLinuxAdditions.run
umount /mnt
