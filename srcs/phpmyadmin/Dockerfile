FROM alpine:3.13

# https://wiki.alpinelinux.org/wiki/PhpMyAdmin
RUN apk update \
	&& apk add \
		openrc \
		openssl \
		nginx \
		wget \
		mysql \
		mysql-client \
		php-mbstring \
		php php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN mkdir -p /run/nginx

#openrc
RUN sed -i'.bak' 's/^#rc_sys=""/rc_sys="lxc"/' /etc/rc.conf \
    && sed -i 's/^#rc_provide="!net"/rc_provide="loopback net"/' /etc/rc.conf \
    && sed -i'.bak' '/getty/d' /etc/inittab \
    && sed -i'.bak' 's/mount -t tmpfs/# mount -t tmpfs/' /lib/rc/sh/init.sh \
    && sed -i'.bak' 's/hostname $opts/# hostname $opts/' /etc/init.d/hostname \
    && sed -i'.bak' 's/cgroup_add_service$/# cgroup_add_service/' /lib/rc/sh/openrc-run.sh \
    && mkdir /run/openrc \
    && touch /run/openrc/softlevel

#user追加
RUN adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www

WORKDIR /www/
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz \
	&& tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz \
	&& rm phpMyAdmin-5.0.2-all-languages.tar.gz \
	&& mv phpMyAdmin-5.0.2-all-languages phpmyadmin \
	&& chown -R www:www phpmyadmin \
	&& chmod -R 777 /www

# nginxで使うhttpsのための設定
WORKDIR /etc/ssl
RUN openssl genrsa \
		-out ./private/phpmyadmin.key 2048 \
	&& openssl req -new \
		-key ./private/phpmyadmin.key \
		-out ./certs/phpmyadmin.csr \
		-subj "/C=JP/ST=Tokyo/L=Roppongi/O=42tokyo/OU=level3/CN=rnakai" \
	&& openssl x509 \
		-days 3650 \
		-req -signkey ./private/phpmyadmin.key \
		-in ./certs/phpmyadmin.csr \
		-out ./certs/phpmyadmin.crt

WORKDIR /

# copy nginx.conf
COPY srcs/nginx.conf /etc/nginx/
RUN chmod 755 /etc/nginx/nginx.conf

# copy nginx.conf
COPY srcs/config.inc.php /www/phpmyadmin
RUN chmod 644 /www/phpmyadmin/config.inc.php

# copy entrypoint
COPY ./srcs/phpmyadmin_init.sh /
RUN	chmod 755 /phpmyadmin_init.sh

ENTRYPOINT [ "/phpmyadmin_init.sh" ]
