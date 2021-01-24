FROM alpine:3.12.3

ENV LANG en_US.UTF-8
ENV TERM xterm

WORKDIR /opt/cups

RUN apk update && apk add --no-cache cups cups-filters bash

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing gutenprint-cups

# Expose SMB printer sharing
#EXPOSE 137/udp 139/tcp 445/tcp

# Expose avahi advertisement
#EXPOSE 5353/udp

#VOLUME /etc/cups/ /var/log/cups /var/spool/cups /var/spool/cups-pdf /var/cache/cup

# Move away config before mounting empty directory
RUN cp -R /etc/cups /opt/cups/etc-cups
COPY ./start.sh .

EXPOSE 631

ENTRYPOINT ["/bin/bash", "start.sh"]
