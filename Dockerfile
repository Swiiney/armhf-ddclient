FROM troyfontaine/armhf-alpinelinux

RUN apk --no-cache add perl

ADD https://sourceforge.net/projects/ddclient/files/ddclient/ddclient-3.8.3/ddclient-3.8.3.tar.bz2/download /ddclient-3.8.3.tar.bz2
RUN tar -xvjf ddclient-3.8.3.tar.bz2
COPY /ddclient-3.8.3/ddclient /usr/sbin/ddclient
RUN rm ddclient-3.8.3.tar.bz2

RUN mkdir /etc/ddclient
COPY ddclient.conf /etc/ddclient/ddclient.conf
RUN chmod 600 /etc/ddclient/ddclient.conf
VOLUME /etc/ddclient

RUN mkdir /var/cache/ddclient
VOLUME /var/cache/ddclient

RUN rm -rf /ddclient-3.8.3/

COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["./run.sh"]
