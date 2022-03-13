#!/bin/sh

if [ -f "/lsky/.env" ]; then
    chmod 777 /lsky/.env
    php artisan key:generate
    if [ ! -d "./storage/app" ]; then
        mv -n storage_bak/* storage/
    fi
    if [ "$INSTALL" != "true" ]; then
        touch installed.lock
    fi
    chmod -R 777 storage
    supervisord
    php artisan clear-compiled
    php artisan optimize
else
    echo "配置文件不存在，请根据文档修改配置文件！"
fi