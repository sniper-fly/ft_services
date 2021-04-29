FROM rnakai/alpine_base:v1

ENV GRAFANA_VERSION 7.4.5

# download grafana
RUN wget https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz \
	&& tar -zxvf grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz \
	&& rm grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz \
	&& mv /grafana-${GRAFANA_VERSION} grafana

# copy grafana general setting
COPY srcs/defaults.ini /grafana/conf/
RUN chmod 644 /grafana/conf/defaults.ini

# copy dashboard and datasources settings
COPY ./srcs/datasources/* /grafana/conf/provisioning/datasources/
COPY ./srcs/dashboards/* /grafana/conf/provisioning/dashboards/

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
