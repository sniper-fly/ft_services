FROM rnakai/alpine_base:v1

RUN apk add --no-cache \
		influxdb

RUN mkdir -p /var/lib/influxdb

##########################
#### common settings #####
##########################
# copy telegraf.conf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN chmod 777 /etc/telegraf/telegraf.conf

# copy entrypoint
COPY srcs/entrypoint.sh /
RUN chmod 755 /entrypoint.sh

# copy livenessprobe shell
COPY ./srcs/livenessprobe.sh /
RUN chmod 755 /livenessprobe.sh
