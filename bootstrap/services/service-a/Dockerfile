FROM nginx:stable-alpine

RUN apk add --no-cache \
    tini \
    curl

COPY --from=consul:latest /bin/consul /bin/consul
RUN chmod +x /bin/consul

COPY ./etc/consul.d/service.json /etc/consul.d/service.json

COPY ./html /usr/share/nginx/html

COPY ./opt/entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

EXPOSE 80 443
ENTRYPOINT [ "/sbin/tini", "-v", "--", "/opt/entrypoint.sh" ]
