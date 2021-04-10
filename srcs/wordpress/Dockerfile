FROM alpine:3.13

ENV WP_VERSION 5.7

RUN apk update \
	&& apk add \
		openrc \
		openssl \
		nginx \
		php7-fpm

#user追加
# RUN adduser -D -g 'www' www \
# 	&& mkdir /www \
# 	&& chown -R www:www /var/lib/nginx \
# 	&& chown -R www:www /www

# install wordpress
WORKDIR /var/www/localhost/htdocs 
RUN wget http://wordpress.org/wordpress-"${WP_VERSION}".tar.gz \
	&& tar -xzvf "${WP_VERSION}".tar.gz \
	&& rm "${WP_VERSION}".tar.gz
	# && chown -R www wordpress

# install wp-cli
WORKDIR /
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp


