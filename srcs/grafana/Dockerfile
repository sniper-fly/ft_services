FROM alpine:3.13

ENV GRAFANA_VERSION 7.5.4

RUN apk update \
	&& apk --no-cache add \
	openrc \
	openssl \
	wget \
	libc6-compat

#openrcの初期設定, 何をやっているかは不明
RUN sed -i'.bak' 's/^#rc_sys=""/rc_sys="lxc"/' /etc/rc.conf \
    && sed -i 's/^#rc_provide="!net"/rc_provide="loopback net"/' /etc/rc.conf \
    && sed -i'.bak' '/getty/d' /etc/inittab \
    && sed -i'.bak' 's/mount -t tmpfs/# mount -t tmpfs/' /lib/rc/sh/init.sh \
    && sed -i'.bak' 's/hostname $opts/# hostname $opts/' /etc/init.d/hostname \
    && sed -i'.bak' 's/cgroup_add_service$/# cgroup_add_service/' /lib/rc/sh/openrc-run.sh \
    && mkdir /run/openrc \
    && touch /run/openrc/softlevel

# download grafana
RUN wget https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz \
	&& tar -zxvf grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz \
	&& rm grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz
	# && mv /grafana-${GRAFANA_VERSION} grafana

# ssl settings
WORKDIR /etc/ssl
RUN openssl genrsa \
		-out ./private/grafana.key 2048 \
	&& openssl req -new \
		-key ./private/grafana.key \
		-out ./certs/grafana.csr \
		-subj "/C=JP/ST=Tokyo/L=Roppongi/O=42tokyo/OU=level3/CN=rnakai" \
	&& openssl x509 \
		-days 3650 \
		-req -signkey ./private/grafana.key \
		-in ./certs/grafana.csr \
		-out ./certs/grafana.crt

WORKDIR /

# copy grafana general setting
COPY srcs/defaults.ini /grafana/conf
RUN chmod 644 /grafana-${GRAFANA_VERSION}/conf/defaults.ini

# copy entrypoint
COPY srcs/grafana_init.sh /
RUN chmod 755 /grafana_init.sh

ENTRYPOINT [ "/grafana_init.sh" ]
