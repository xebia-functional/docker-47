FROM 47deg/java7

MAINTAINER 47 Degrees <developer@47deg.com>

ADD scripts/start-master.sh /start-master.sh
ADD scripts/start-worker /start-worker.sh
ADD scripts/spark-shell.sh  /spark-shell.sh
ADD scripts/spark-defaults.conf /spark-defaults.conf
ADD scripts/remove_alias.sh /remove_alias.sh

ENV MAVEN_VERSION 3.3.3
ENV MAVEN_OPTS -Xmx2048m -XX:MaxPermSize=512M
ENV JAVA_OPTIONS -Xms2G -Xmx4096m -XX:ReservedCodeCacheSize=128m -XX:MaxPermSize=512M
ENV JAVA_OPTS -Xms2G -Xmx2G -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=128M -XX:+UseCodeCacheFlushing

RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.4.1.tgz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s spark-1.4.1 spark
RUN cd /usr/local/spark/ && dev/change-version-to-2.11.sh && mvn -Phadoop-2.4 -Dscala-2.11 -DskipTests clean package

ENV SPARK_HOME /usr/local/spark

ENV SPARK_MASTER_OPTS="-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"
ENV SPARK_WORKER_OPTS="-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_WORKER_PORT 8888
ENV SPARK_WORKER_WEBUI_PORT 8081

EXPOSE 8080 7077 8888 8081 4040 7001 7002 7003 7004 7005 7006 
