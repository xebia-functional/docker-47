FROM 47deg/java7

MAINTAINER 47 Degrees <developer@47deg.com>

ENV KAFKA_VERSION="0.8.2.1"
ENV SCALA_VERSION="2.10"

RUN apt-get update && apt-get install -y unzip git docker.io jq

ADD download-kafka.sh /tmp/download-kafka.sh
RUN /tmp/download-kafka.sh
RUN tar xf /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh
CMD start-kafka.sh
