#!/bin/sh

pgrep mysqld
mysqld=$?
pgrep telegraf
telegraf=$?
if [ ${mysqld} != 0 -o ${telegraf} != 0 ]; then
    exit 1
else
    exit 0
fi
