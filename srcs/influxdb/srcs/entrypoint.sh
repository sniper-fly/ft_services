#!/bin/sh

# launch influxd
/usr/sbin/influxd -config /etc/influxdb.conf &

echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo "--------------------------------------------------"
influx -execute 'CREATE USER admin WITH PASSWORD "admin"'

influx -execute 'CREATE DATABASE wordpress'
influx -execute 'GRANT ALL ON wordpress TO admin'

influx -execute 'CREATE DATABASE mysql'
influx -execute 'GRANT ALL ON mysql TO admin'

influx -execute 'CREATE DATABASE nginx'
influx -execute 'GRANT ALL ON nginx TO admin'

influx -execute 'CREATE DATABASE phpmyadmin'
influx -execute 'GRANT ALL ON phpmyadmin TO admin'

influx -execute 'CREATE DATABASE influxdb'
influx -execute 'GRANT ALL ON influxdb TO admin'

influx -execute 'CREATE DATABASE grafana'
influx -execute 'GRANT ALL ON grafana TO admin'

influx -execute 'CREATE DATABASE ftps'
influx -execute 'GRANT ALL ON ftps TO admin'
influx -execute 'SHOW DATABASES'
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo "--------------------------------------------------"

#launch telegraf
/telegraf-1.17.2/usr/bin/telegraf --config /etc/telegraf/telegraf.conf &

sleep infinity
