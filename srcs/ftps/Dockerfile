FROM rnakai/alpine_base:v1

RUN apk --no-cache add \
	vsftpd \
	lftp

# create user
RUN adduser -D ftptest \
	&& echo "ftptest:ftptest" | chpasswd
	# && chmod -R 777 /home/ftptest

# cp vsftpd setting
COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod 777 /etc/vsftpd/vsftpd.conf

# cp lftp setting
COPY ./srcs/.lftprc /home/ftptest/
RUN chmod 644 /home/ftptest/.lftprc

# create vsftpd.log, etc.
RUN touch /var/log/vsftpd.log \
	&& echo "ftptest" >> /etc/vsftpd/vsftpd.userlist

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
