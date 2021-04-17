FROM alpine:3.13

RUN apk update \
	&& apk --no-cache add \
		nginx \
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

COPY srcs/nginx.conf /etc/nginx/

ENTRYPOINT [ "/nginx_init.sh" ]
