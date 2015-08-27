FROM 47deg/baseimage

MAINTAINER 47 Degrees <developer@47deg.com>

# Install Python & PIP
RUN \
    apt-get update; \
    apt-get install -y -qq python-dev python-setuptools; \
    easy_install pip;

# Download and extract OpsCenter
RUN \
  mkdir /opt/opscenter; \
  wget -O - http://downloads.datastax.com/community/opscenter-5.2.0.tar.gz \
  | tar xzf - --strip-components=1 -C "/opt/opscenter";

ADD . /src

# Copy over daemons
RUN \
  mkdir -p /etc/service/opscenter; \
  cp /src/run /etc/service/opscenter/; \
  ln -s /opt/opscenter/log /var/log/opscenter;

# Expose ports
EXPOSE 8888

WORKDIR /opt/opscenter

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]