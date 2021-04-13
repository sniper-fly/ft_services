#!/bin/sh

rc-status
rc-service php-fpm7 start

cd /www/wordpress

## mysql-serviceの準備ができるまで待つ
sleep 10

wp core install \
	--url=https://192.168.49.2:5050 \
	--title=test \
	--admin_user=admin \
	--admin_password=admin \
	--admin_email=admin@example.com
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
