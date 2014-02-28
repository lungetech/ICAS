#!/bin/bash -eux

# enable SQL support.  (mysql root passwd set in preseed.cfg)
echo 'CREATE DATABASE radius;' | mysql -uroot -pradius
mysql -u root -pradius radius < /etc/freeradius/sql/mysql/schema.sql
mysql -u root -pradius radius < /etc/freeradius/sql/mysql/admin.sql
mysql -u root -pradius radius < /etc//freeradius/sql/mysql/nas.sql
echo "INSERT INTO radius.radcheck (id, username, attribute, op, value) VALUES (NULL , 'test', 'MD5-Password', ':=', MD5('1234'));" | mysql -u root -pradius radius
sed -ri 's/^\s*#\s*sql$/sql/' /etc/freeradius/sites-enabled/default
sed -ri 's/^#(.*)sql.conf/\1 sql.conf/' /etc/freeradius/radiusd.conf

# allow any IP to connect to the radius server
cat <<EOF >> /etc/freeradius/clients.conf
client 0/0 {
    secret = testing123
    shortname = anywhere
}
EOF

# restart (hopefully to catch unknown errors)
/etc/init.d/freeradius restart
