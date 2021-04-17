FROM alpine:3.12

RUN apk update \
	&& apk add --no-cache \
		influxdb

RUN mkdir -p /var/lib/influxdb

COPY ./srcs/influxdb_init.sh /
RUN chmod 777 /influxdb_init.sh

ENTRYPOINT ["./influxdb_init.sh"]
