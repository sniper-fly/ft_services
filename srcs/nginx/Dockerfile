FROM alpine:3.13

RUN apk update \
	&& apk --no-cache add \
		nginx \
		wget \
		libc6-compat \
		openssl

# for debug in container
# RUN apk add mandoc man-pages

RUN mkdir -p /run/nginx

WORKDIR /etc/ssl
RUN openssl genrsa \
		-out ./private/nginx.key 2048 \
	&& openssl req -new \
		-key ./private/nginx.key \
		-out ./certs/nginx.csr \
		-subj "/C=JP/ST=Tokyo/L=Roppongi/O=42tokyo/OU=level3/CN=rnakai" \
	&& openssl x509 \
		-days 3650 \
		-req -signkey ./private/nginx.key \
		-in ./certs/nginx.csr \
		-out ./certs/nginx.crt

COPY srcs/nginx_init.sh /
RUN chmod 755 /nginx_init.sh

WORKDIR /
# telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz \
	&& tar xf telegraf-1.17.2_linux_amd64.tar.gz \
	&& rm telegraf-1.17.2_linux_amd64.tar.gz \
	&& mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN chmod 777 /etc/telegraf/telegraf.conf

COPY srcs/nginx.conf /etc/nginx/

# copy livenessprobe shell
COPY ./srcs/livenessprobe.sh /
RUN chmod 755 /livenessprobe.sh

ENTRYPOINT [ "/nginx_init.sh" ]
