#!/bin/sh

rc-status
rc-service php-fpm7 start

#launch telegraf
/telegraf-1.17.2/usr/bin/telegraf --config /etc/telegraf/telegraf.conf &

cd /www/wordpress

wp core install \
	--url=https://192.168.49.2:5050 \
	--title=test \
	--admin_user=admin \
	--admin_password=admin \
	--admin_email=admin@example.com

# if mysql service is not ready, exit
connection_result=$?
echo "-----------connection result--------------"
echo $connection_result
echo "------------------------------------------"
if [ $connection_result -ne 0 ] ; then
	exit $connection_result
fi

wp user create eren eren@example.com \
	--role=editor \
	--user_pass=eren
wp user create armin armin@example.com \
	--role=author \
	--user_pass=armin
wp user create mikasa mikasa@example.com \
	--role=author \
	--user_pass=mikasa

nginx

sleep infinity
