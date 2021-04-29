FROM alpine:3.13

RUN apk update \
	&& apk --no-cache add \
		libc6-compat \
		wget \
		openssl

WORKDIR /etc/ssl
RUN openssl genrsa \
		-out ./private/server.key 2048 \
	&& openssl req -new \
		-key ./private/server.key \
		-out ./certs/server.csr \
		-subj "/C=JP/ST=Tokyo/L=Roppongi/O=42tokyo/OU=level3/CN=rnakai" \
	&& openssl x509 \
		-days 3650 \
		-req -signkey ./private/server.key \
		-in ./certs/server.csr \
		-out ./certs/server.crt

WORKDIR /
# telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz \
	&& tar xf telegraf-1.17.2_linux_amd64.tar.gz \
	&& rm telegraf-1.17.2_linux_amd64.tar.gz \
	&& mkdir -p /etc/telegraf

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
