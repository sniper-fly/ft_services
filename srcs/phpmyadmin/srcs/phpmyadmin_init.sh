#!/bin/sh

rc-status
echo "--------------php-fpm7----------------"
rc-service php-fpm7 start
echo "--------------------------------------"

nginx

sleep infinity
