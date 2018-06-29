FROM ubuntu:16.04

LABEL maintainer="tnds82"

COPY init/ /etc/my_init.d/
COPY defaults/ /root/
COPY zmeventnotification/zmeventnotification.pl /usr/bin/
COPY zmeventnotification/zmeventnotification.ini /root/

RUN apt-get update && \
	apt-get install software-properties-common -y && \
        add-apt-repository -y ppa:iconnor/zoneminder && \
	apt-get update && \
	apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
	apt-get dist-upgrade -y
