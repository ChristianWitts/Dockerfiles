FROM python:3-buster

LABEL maintainer="Christian Witts <cwitts@gmail.com>"

RUN apt-get update \
 && apt-get install -y \
        ruby \
        ruby-dev \
        rubygems \
        build-essential \
 && gem install --no-ri --no-rdoc fpm -v 1.11 \
 && pip install \
        wheel==0.33.6 \
        virtualenv==16.7.5 \
 && git clone https://github.com/ChristianWitts/virtualenv-tools.git /tmp/virtualenv-tools \
 && pip install /tmp/virtualenv-tools

WORKDIR /src
