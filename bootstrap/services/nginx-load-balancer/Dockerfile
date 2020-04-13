FROM debian:stable

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

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

EXPOSE 80 443
ENTRYPOINT [ "/tini", "-v", "--", "/opt/entrypoint.sh" ]
