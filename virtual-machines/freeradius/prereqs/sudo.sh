#!/bin/sh

if [ -d /etc/sudoers.d ]; then
    echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant
    chmod 0440 /etc/sudoers.d/vagrant
else
    for i in /etc/sudoers /usr/local/etc/sudoers; do
        if [ -f $i ]; then
            echo 'vagrant ALL=NOPASSWD:ALL' >> $i
        fi
    done
fi
