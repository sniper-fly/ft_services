FROM alpine:3.13

RUN apk update \
	&& apk --no-cache add \
		openrc \
		nginx \
		openssl

# for debug in container
# RUN apk add mandoc man-pages

RUN mkdir -p /run/nginx

#openrcの初期設定, 何をやっているかは不明
RUN sed -i'.bak' 's/^#rc_sys=""/rc_sys="lxc"/' /etc/rc.conf \
    && sed -i 's/^#rc_provide="!net"/rc_provide="loopback net"/' /etc/rc.conf \
    && sed -i'.bak' '/getty/d' /etc/inittab \
    && sed -i'.bak' 's/mount -t tmpfs/# mount -t tmpfs/' /lib/rc/sh/init.sh \
    && sed -i'.bak' 's/hostname $opts/# hostname $opts/' /etc/init.d/hostname \
    && sed -i'.bak' 's/cgroup_add_service$/# cgroup_add_service/' /lib/rc/sh/openrc-run.sh \
    && mkdir /run/openrc \
    && touch /run/openrc/softlevel \
    && sed -i'.bak' 's/return 404;/root html;\n\t\tindex index.html;/' /etc/nginx/conf.d/default.conf

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

COPY srcs/entry-point.sh /

COPY srcs/nginx.conf /etc/nginx/

ENTRYPOINT [ "/entry-point.sh" ]
