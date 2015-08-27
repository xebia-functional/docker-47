FROM phusion/baseimage

MAINTAINER 47 Degrees <developer@47deg.com>

# Install Oracle Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \
  rm -rf /tmp/* && \
  rm -rf /var/tmp/*

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

CMD ["bash"]