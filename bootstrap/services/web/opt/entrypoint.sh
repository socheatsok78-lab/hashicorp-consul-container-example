#!/usr/bin/env sh

set -e

# Define cleanup procedure
cleanup() {
    echo "Container stopped, leaving service cluster..."
    consul leave -http-addr ${CONSUL_HTTP_ADDR}
}

# Trap SIGTERM
trap 'cleanup' SIGTERM SIGKILL

echo "======> Starting Consul agent..."
consul agent \
    -retry-join ${CONSUL_HTTP_ADDR} \
    -client 0.0.0.0 \
    -enable-script-checks \
    -config-dir=/etc/consul.d \
    -data-dir=/tmp/consul &

exec nginx -g 'daemon off;'
