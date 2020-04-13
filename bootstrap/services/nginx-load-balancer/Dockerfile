FROM debian:stable

RUN apt-get update && \
    apt-get install -y \
    curl \
    nginx

COPY --from=consul:latest /bin/consul /bin/consul
COPY --from=hashicorp/consul-template:latest /consul-template /bin/consul-template
RUN chmod +x /bin/consul*

COPY ./etc/consul.d/ /etc/consul.d/

COPY ./opt /opt
RUN chmod +x /opt/*.sh

STOPSIGNAL SIGTERM

EXPOSE 80 443
ENTRYPOINT [ "/opt/entrypoint.sh" ]
