FROM debian:stable AS consul-bootstrap

ENV CONSUL_VERSION 1.7.2
ENV CONSUL_DOWNLOAD_URL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip

ENV CONSUL_TEMPLATE_VERSION 0.24.1
ENV CONSUL_TEMPLATE_DOWNLOAD_URL https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip

RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip

RUN curl -o consul_linux_amd64.zip $CONSUL_DOWNLOAD_URL && \
    unzip consul_linux_amd64.zip && \
    mv consul /usr/bin/consul && \
    chmod +x /usr/bin/consul

RUN curl -o consul_template_linux_amd64.zip $CONSUL_TEMPLATE_DOWNLOAD_URL && \
    unzip consul_template_linux_amd64.zip && \
    mv consul-template /usr/bin/consul-template && \
    chmod +x /usr/bin/consul-template

FROM nginx:stable-alpine

RUN apk add curl

COPY --from=consul-bootstrap /usr/bin/consul* /usr/bin/
RUN chmod +x /usr/bin/consul*

COPY ./etc/consul.d/ /etc/consul.d/

COPY ./opt /opt
RUN chmod +x /opt/*.sh

EXPOSE 80 443
ENTRYPOINT [ "/opt/entrypoint.sh" ]
