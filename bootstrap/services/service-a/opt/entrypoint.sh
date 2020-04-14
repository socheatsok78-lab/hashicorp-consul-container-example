#!/usr/bin/env sh

set -e

echo "======> Starting nginx..."
nginx -g 'daemon off;' &

echo "======> Starting Consul agent..."
exec consul agent \
    -retry-join ${CONSUL_HTTP_ADDR} \
    -client 0.0.0.0 \
    -enable-script-checks \
    -config-dir=/etc/consul.d \
    -data-dir=/tmp/consul
