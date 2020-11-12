FROM alpine:3.12

MAINTAINER ivandreyv

RUN apk update && apk add postfix bash supervisor && sed -i 's/inet_protocols = all/inet_protocols = ipv4/g' /etc/postfix/main.cf \
    && mkdir -p /var/log/supervisor && mkdir -p /run/supervisor/ \
    && apk add swaks --update-cache --repository http://nl.alpinelinux.org/alpine/edge/testing
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY supervisord.conf /etc/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
