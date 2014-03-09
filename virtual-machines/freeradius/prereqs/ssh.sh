#!/bin/sh

if [ -f /etc/ssh/sshd_config ]; then

echo <<EOF >> /etc/ssh/sshd_configg
UseDNS no
GSSAPIAuthentication no
EOF

fi
