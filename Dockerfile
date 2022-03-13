FROM webdevops/php-nginx:8.0-alpine

WORKDIR /lsky

ENV INSTALL=true

COPY lsky/ /lsky
COPY ./conf/default.conf /opt/docker/etc/nginx/vhost.conf
COPY start.sh /

RUN set -xe \
    && composer install -vvv \
    && chmod +x /start.sh \
    && chown -R application:application /lsky/ \
    && chmod -R 0755 /lsky/ \
    && mv /lsky/storage /lsky/storage_bak

VOLUME /lsky/image

CMD /start.sh
