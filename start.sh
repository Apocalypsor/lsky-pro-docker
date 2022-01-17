#!/bin/bash

if [ -f "/lsky/.env" ]; then
    if [ "$INSTALL" == "true" ]; then
        chmod 777 /lsky/application
    else
        echo "ok" > /lsky/application/install.lock
    fi
    if [ "$(ls -A /lsky/image/)" ]; then
        echo "Skip creating image folders"
    else
        for i in {10..99}; do
          mkdir /lsky/image/20"$i"
        done
    fi
    ln -s /lsky/image/* /lsky/public/
    chmod -R 777 /lsky/image
    supervisord
else
    echo "配置文件不存在，请根据文档修改配置文件！"
fi