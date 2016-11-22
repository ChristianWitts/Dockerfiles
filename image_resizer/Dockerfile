FROM openresty/openresty:latest-xenial

MAINTAINER cwitts@gmail.com

ARG   GIT_COMMIT
ARG   VERSION
LABEL Description="This image is used to start an image resizer container."
LABEL REPO="https://github.com/ChristianWitts/Dockerfiles"
LABEL GIT_COMMIT=$GIT_COMMIT
LABEL VERSION=$VERSION

RUN  apt-get update && \
     apt-get install -y --no-install-recommends \
         git \
         libmagickwand-dev \
         libssl-dev && \
     rm -rf /var/lib/apt/lists/*

RUN  /usr/local/openresty/luajit/bin/luarocks install magick && \
     /usr/local/openresty/luajit/bin/luarocks install s3

ADD  nginx.conf      /usr/local/openresty/nginx/conf/nginx.conf
ADD  serve_image.lua /usr/local/openresty/nginx/conf/serve_image.lua

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]

