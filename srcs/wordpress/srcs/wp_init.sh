#!/bin/sh

rc-status
rc-service php-fpm7 start

cd /var/www/localhost/htdocs/wordpress
# wp core install --url=http://wordpress-service:5050/wordpress/ \
# 	--title=test \
# 	--admin_user=admin \
# 	--admin_password=admin \
# 	--admin_email=admin@example.com  \
# 	--allow-root \
# 	--path=/usr/share/webapps/wordpress/
	# && wp language core install ja --allow-root --path=/usr/share/webapps/wordpress/ \
	# && wp site switch-language ja --allow-root --path=/usr/share/webapps/wordpress/ \
wp user create eren eren@example.com \
	--role=editor \
	--user_pass=eren \
	--allow-root \
	# --path=/usr/share/webapps/wordpress/
wp user create armin armin@example.com \
	--role=author \
	--user_pass=armin \
	--allow-root \
	# --path=/usr/share/webapps/wordpress/
wp user create mikasa armin@example.com \
	--role=author \
	--user_pass=mikasa \
	--allow-root \
	# --path=/usr/share/webapps/wordpress/

nginx

sleep infinity
