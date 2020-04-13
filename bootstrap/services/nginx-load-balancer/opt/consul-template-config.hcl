consul {
    address = "consul-server-bootstrap:8500"
    retry {
        enabled  = true
        attempts = 12
        backoff  = "250ms"
    }
}

template {
    source      = "/etc/consul.d/load-balancer.conf.ctmpl"
    destination = "/etc/nginx/conf.d/load-balancer.conf"
    perms       = 0600
    backup      = true
    command     = "/opt/nginx-revalidate.sh"
}
