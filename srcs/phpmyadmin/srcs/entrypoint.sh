#!/bin/sh

rc-status
echo "--------------php-fpm7----------------"
rc-service php-fpm7 start
echo "--------------------------------------"

#launch telegraf
/telegraf-1.17.2/usr/bin/telegraf --config /etc/telegraf/telegraf.conf &

nginx

sleep infinity
