#!/usr/bin/env sh

set -e

echo "======> Starting nginx..."
service nginx start

echo "======> Initialize nginx load-balancer..."

consul-template \
    -config=/opt/consul-template-config.hcl \
    &

echo "======> Starting Consul agent..."
exec consul agent \
    -retry-join ${CONSUL_HTTP_ADDR} \
    -client 0.0.0.0 \
    -enable-script-checks \
    -config-dir=/etc/consul.d \
    -data-dir=/tmp/consul
