FROM openresty/openresty:latest-xenial

MAINTAINER cwitts@gmail.com
LABEL Description="This image is used to start an image resizer container."

RUN  apt-get update && \
     apt-get install -y --no-install-recommends \
         libmagickwand-dev=8:6.8.9.9-7ubuntu5.1 \
         luajit=2.0.4+dfsg-1 && \
     rm -rf /var/lib/apt/lists/* && \
     /usr/local/openresty/luajit/bin/luarocks install magick

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
