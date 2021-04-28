FROM alpine:3.12

RUN apk update \
	&& apk add --no-cache \
		wget \
		libc6-compat \
		influxdb

RUN mkdir -p /var/lib/influxdb

# telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz \
	&& tar xf telegraf-1.17.2_linux_amd64.tar.gz \
	&& rm telegraf-1.17.2_linux_amd64.tar.gz \
	&& mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN chmod 777 /etc/telegraf/telegraf.conf

# copy livenessprobe shell
COPY ./srcs/livenessprobe.sh /
RUN chmod 755 /livenessprobe.sh

# copy entrypoint
COPY ./srcs/influx_init.sh /
RUN chmod 777 /influx_init.sh

ENTRYPOINT ["./influx_init.sh"] 
