#!/bin/sh

if [ -x /usr/bin/apt-get ]; then
    apt-get -y autoremove build-essential
    apt-get -y clean
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
fi

if [ -x /usr/local/sbin/portsclean ]; then
    /usr/local/sbin/portsclean -C
fi

if [ -f /etc/network/interfaces ]; then
    echo "pre-up sleep 2" >> /etc/network/interfaces
fi

if [ -d /var/lib/dhcp ]; then
    rm -f /var/lib/dhcp/*
fi

if [ -f /root/.history ]; then
    cat /dev/null > /root/.history
fi

dd if=/dev/zero of=/tmp/EMPTY bs=1M
rm -f /tmp/EMPTY
sync
