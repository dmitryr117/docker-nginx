# This is updated version based of of madharjan/docker-nginx

FROM dmitryr117/docker-base:ubuntu18.04
MAINTAINER Dmitry Rodetsky <colirs.developer@gmail.com>

ARG VCS_REF
ARG NGINX_VERSION
ARG DEBUG=false

LABEL description="Docker container for Nginx" os_version="Ubuntu ${UBUNTU_VERSION}" \
      org.label-schema.vcs-ref=${VCS_REF} org.label-schema.vcs-url="https://github.com/dmitryr117/docker-nginx"

ENV NGINX_VERSION ${NGINX_VERSION}

RUN mkdir -p /build
COPY . /build

RUN /build/scripts/install.sh && /build/scripts/cleanup.sh




VOLUME ["/etc/nginx/conf.d", "/usr/share/nginx/html", "/var/log/nginx"]

CMD ["/sbin/my_init"]

EXPOSE 80
