#!/bin/sh

if [ -f "/lsky/.env" ]; then
    php artisan key:generate
    if [ ! -d "./storage/app" ]; then
        mv -n storage_bak/* storage/
    fi
    if [ "$INSTALL" != "true" ]; then
        echo "ok" > install.lock
    fi
    chmod -R 777 storage
    supervisord
    php artisan clear-compiled
    php artisan optimize
    php artisan migrate
else
    echo "配置文件不存在，请根据文档修改配置文件！"
fi