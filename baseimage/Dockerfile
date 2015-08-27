FROM phusion/baseimage

MAINTAINER 47 Degrees <developer@47deg.com>

# Install basic packages
RUN \
    apt-get update; apt-get upgrade -y -qq; \
    apt-get install -y -qq wget; \
    apt-get install -y -qq curl; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]