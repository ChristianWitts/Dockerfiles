FROM openresty/openresty:latest-xenial

MAINTAINER cwitts@gmail.com
LABEL Description="This image is used to start an image resizer container."

RUN  apt-get update && \
     apt-get install -y --no-install-recommends \
         git \
         libmagickwand-dev \
         libssl-dev \
         luajit && \
     rm -rf /var/lib/apt/lists/*

RUN  /usr/local/openresty/luajit/bin/luarocks install magick && \
     /usr/local/openresty/luajit/bin/luarocks install s3

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
