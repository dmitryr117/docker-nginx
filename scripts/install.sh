#!/bin/bash
set -e
export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

if [ "${DEBUG}" = true ]; then
  set -x
fi

NGINX_CONFIG_PATH=/build/config/nginx

apt-get update

## Install Nginx and runit service
/build/services/nginx/nginx.sh

mkdir -p /config/etc/nginx/conf.d
mkdir -p /config/usr/share/nginx/html

cp ${NGINX_CONFIG_PATH}/default.conf /config/etc/nginx/conf.d/default.conf
cp ${NGINX_CONFIG_PATH}/index.html /config/usr/share/nginx/html/index.html
cp ${NGINX_CONFIG_PATH}/50x.html /config/usr/share/nginx/html/50x.html
cp ${NGINX_CONFIG_PATH}/favicon.ico /config/usr/share/nginx/html/favicon.ico

mkdir -p /etc/my_init.d
cp /build/services/nginx-startup.sh /etc/my_init.d
chmod 750 /etc/my_init.d/nginx-startup.sh
