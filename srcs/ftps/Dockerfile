FROM rnakai/alpine_base:v1

RUN apk --no-cache add \
	vsftpd \
	lftp

# create user
RUN adduser -D ftptest \
	&& echo "ftptest:ftptest" | chpasswd

# cp vsftpd setting
COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod 644 /etc/vsftpd/vsftpd.conf

# cp vsftpd setting
COPY ./srcs/.lftprc /home/ftptest/
RUN chmod 644 /home/ftptest/.lftprc

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
