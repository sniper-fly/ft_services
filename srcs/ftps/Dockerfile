FROM alpine:3.13

RUN apk update \
	&& apk --no-cache add \
	vsftpd \
	lftp \
	openssl \
	wget \
	libc6-compat

# ssl settings
WORKDIR /etc/ssl
RUN openssl genrsa \
		-out ./private/ftps.key 2048 \
	&& openssl req -new \
		-key ./private/ftps.key \
		-out ./certs/ftps.csr \
		-subj "/C=JP/ST=Tokyo/L=Roppongi/O=42tokyo/OU=level3/CN=rnakai" \
	&& openssl x509 \
		-days 3650 \
		-req -signkey ./private/ftps.key \
		-in ./certs/ftps.csr \
		-out ./certs/ftps.crt

WORKDIR /

# telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz \
	&& tar xf telegraf-1.17.2_linux_amd64.tar.gz \
	&& rm telegraf-1.17.2_linux_amd64.tar.gz \
	&& mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN chmod 777 /etc/telegraf/telegraf.conf

# create user
RUN adduser -D ftptest \
	&& echo "ftptest:ftptest" | chpasswd

# cp vsftpd setting
COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod 644 /etc/vsftpd/vsftpd.conf

# cp vsftpd setting
COPY ./srcs/.lftprc /home/ftptest/
RUN chmod 644 /home/ftptest/.lftprc

# copy livenessprobe shell
COPY ./srcs/livenessprobe.sh /
RUN chmod 755 /livenessprobe.sh

# copy entrypoint
COPY srcs/ftps_init.sh /
RUN chmod 755 /ftps_init.sh

ENTRYPOINT [ "/ftps_init.sh" ]
