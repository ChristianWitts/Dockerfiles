FROM centos:7

LABEL maintainer="Christian Witts <cwitts@gmail.com>"

RUN yum update -y \
 && yum install -y \
        centos-release-scl \
        gcc \
        git \
        make \
        ruby-devel \
        rpm-build \
        rubygems \
 && yum install -y \
        rh-python36 \
        rh-python36-scldevel \
        rh-python36-python-pip \
 && yum groupinstall -y 'Development Tools' \
 && gem install --no-ri --no-rdoc fpm -v 1.11 \
 && . /opt/rh/rh-python36/enable \
 && curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py \
 && python /tmp/get-pip.py \
 && pip install --upgrade pip==19.2.3 \
 && pip install \
        wheel==0.33.6 \
        virtualenv==16.7.5 \
 && git clone https://github.com/ChristianWitts/virtualenv-tools.git /tmp/virtualenv-tools \
 && pip install /tmp/virtualenv-tools

WORKDIR /src

