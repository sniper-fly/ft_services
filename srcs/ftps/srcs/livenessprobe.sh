#!/bin/sh

pgrep vsftpd
vsftpd=$?
pgrep telegraf
telegraf=$?
if [ ${vsftpd} != 0 -o ${telegraf} != 0 ]; then
    exit 1
else
    exit 0
fi
