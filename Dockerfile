FROM webdevops/php-nginx:7.4-alpine

WORKDIR /lsky

ENV INSTALL=true
ENV CONTAINER_UID=101

COPY lsky/ /lsky
COPY ./conf/default.conf /opt/docker/etc/nginx/vhost.conf
COPY start.sh /

RUN set -xe \
    && chmod +x /start.sh \
    && mkdir /lsky/image \
    && chmod -R 777 /lsky/runtime /lsky/public /lsky/config /lsky/image

VOLUME /lsky/image

CMD /start.sh
