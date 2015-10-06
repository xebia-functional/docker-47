FROM 47deg/java7

MAINTAINER 47 Degrees <developer@47deg.com>

RUN wget -q -O - http://mirror.vorboss.net/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt
RUN mv /opt/zookeeper-3.4.6/conf/zoo_sample.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg
RUN ln -s /opt/zookeeper-3.4.6 /opt/zookeeper

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV ZK_HOME /opt/zookeeper
RUN sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg; mkdir $ZK_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh
EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper
VOLUME ["/opt/zookeeper/conf", "/opt/opt/zookeeper/data"]

CMD /usr/sbin/sshd && start-zk.sh
