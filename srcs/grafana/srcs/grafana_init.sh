#!/bin/sh

#launch telegraf
/telegraf-1.17.2/usr/bin/telegraf --config /etc/telegraf/telegraf.conf &

/grafana-${GRAFANA_VERSION}/bin/grafana-server --homepath /grafana-${GRAFANA_VERSION} &

sleep infinity
