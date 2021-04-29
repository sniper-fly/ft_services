
FROM rnakai/alpine_base:v1

RUN apk --no-cache add \
		nginx

RUN mkdir -p /run/nginx

# copy nginx.conf
COPY srcs/nginx.conf /etc/nginx/
RUN chmod 755 /etc/nginx/nginx.conf

# copy index.html
COPY ./srcs/index.html /var/lib/nginx/html/
RUN chmod 644 /var/lib/nginx/html/index.html


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
