#!/usr/bin/env sh

set -e

if [ -f "/etc/nginx/conf.d/default.conf" ]; then
    rm /etc/nginx/conf.d/default.conf || true
fi

echo "======> Validating nginx configurations..."
nginx \
    -t \
    -c /etc/nginx/nginx.conf

echo "======> Reloading nginx configurations..."

nginx \
    -s reload \
    -c /etc/nginx/nginx.conf
