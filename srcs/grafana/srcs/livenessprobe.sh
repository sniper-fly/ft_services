#!/bin/sh

pgrep grafana
grafana=$?
pgrep telegraf
telegraf=$?
if [ ${grafana} != 0 -o ${telegraf} != 0 ]; then
    exit 1
else
    exit 0
fi
