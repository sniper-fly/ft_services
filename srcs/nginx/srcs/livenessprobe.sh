#!/bin/sh

pgrep nginx
nginx=$?
pgrep telegraf
telegraf=$?
if [ ${nginx} != 0 -o ${telegraf} != 0 ]; then
    exit 1
else
    exit 0
fi
