FROM debian:stable AS consul-bootstrap

ENV CONSUL_VERSION 1.7.2
ENV CONSUL_DOWNLOAD_URL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip

RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip

RUN curl -o consul_linux_amd64.zip $CONSUL_DOWNLOAD_URL && \
    unzip consul_linux_amd64.zip && \
    cp consul /usr/bin/consul && \
    chmod +x /usr/bin/consul

FROM nginx:stable-alpine

RUN apk add curl

COPY --from=consul-bootstrap /usr/bin/consul /usr/bin/consul
RUN chmod +x /usr/bin/consul

COPY ./etc/consul.d/service.json /etc/consul.d/service.json

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 80 443
ENTRYPOINT [ "./entrypoint.sh" ]
