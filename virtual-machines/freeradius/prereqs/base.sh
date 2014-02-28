#!/bin/bash -eux

apt-get -y install linux-headers-$(uname -r)
apt-get -y install --no-install-recommends libdbus-1-3

cat <<EOF >> /etc/ssh/sshd_config
UseDNS no
GSSAPIAuthentication no
EOF

cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US cgroup_enable=memory swapaccount=1"
EOF

update-grub
