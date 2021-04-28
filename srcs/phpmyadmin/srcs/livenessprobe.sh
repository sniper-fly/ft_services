#!/bin/sh

pgrep nginx
nginx=$?
pgrep php-fpm7
phpfpm=$?
pgrep telegraf
telegraf=$?
if [ ${phpfpm} != 0 -o ${telegraf} != 0 -o ${nginx} != 0 ]; then
    exit 1
else
    exit 0
fi
