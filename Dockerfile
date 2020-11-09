FROM alpine:3.12

MAINTAINER ivandreyv

RUN apk update && apk add postfix bash supervisor && sed -i 's/inet_protocols = all/inet_protocols = ipv4/g' /etc/postfix/main.cf \
    && mkdir -p /var/log/supervisor && mkdir -p /run/supervisor/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY supervisord.conf /etc/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
