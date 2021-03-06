FROM rnakai/alpine_base:v1

ENV WP_VERSION 5.7

RUN apk --no-cache add \
		openrc \
		nginx \
		curl \
		mysql \
		mysql-client \
		php php7-fpm php7-phar php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

# openrcの初期設定, 何をやっているかは不明
RUN sed -i'.bak' 's/^#rc_sys=""/rc_sys="lxc"/' /etc/rc.conf \
    && sed -i 's/^#rc_provide="!net"/rc_provide="loopback net"/' /etc/rc.conf \
    && sed -i'.bak' '/getty/d' /etc/inittab \
    && sed -i'.bak' 's/mount -t tmpfs/# mount -t tmpfs/' /lib/rc/sh/init.sh \
    && sed -i'.bak' 's/hostname $opts/# hostname $opts/' /etc/init.d/hostname \
    && sed -i'.bak' 's/cgroup_add_service$/# cgroup_add_service/' /lib/rc/sh/openrc-run.sh \
    && mkdir /run/openrc \
    && touch /run/openrc/softlevel \
    && sed -i'.bak' 's/return 404;/root html;\n\t\tindex index.html;/' /etc/nginx/conf.d/default.conf

# mkdirしないとdaemon offでエラー出る
RUN mkdir -p /run/nginx

# user追加
RUN adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www

# install wordpress
WORKDIR /www
RUN wget http://wordpress.org/wordpress-"${WP_VERSION}".tar.gz \
	&& tar -xzvf wordpress-"${WP_VERSION}".tar.gz \
	&& rm wordpress-"${WP_VERSION}".tar.gz \
	&& chmod 755 wordpress \
	&& chown -R www:www wordpress
COPY ./srcs/wp-config.php ./wordpress/
RUN chmod 644 ./wordpress/wp-config.php \
	&& chown -R www:www ./wordpress/wp-config.php

WORKDIR /

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# copy nginx.conf
COPY srcs/nginx.conf /etc/nginx/
RUN chmod 755 /etc/nginx/nginx.conf

# set php config file
COPY srcs/www.conf /etc/php7/php-fpm.d/
RUN chmod 755 /etc/php7/php-fpm.d/www.conf


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
