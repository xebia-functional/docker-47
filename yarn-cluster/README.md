# Apache Yarn 2.4.0 Cluster Docker image

This repository contains a set of scripts and configuration files to run a [Apache Hadoop](https://hadoop.apache.org/) in a [YARN cluster](http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html) from [Docker](https://www.docker.io/) containers.

## Installation

[Docker](https://www.docker.com/)

## Build Docker Image

    docker build --rm --no-cache -t 47deg/yarn-cluster .

## Push Image

    docker push 47deg/yarn-cluster

## Run

### Start an Apache Yarn namenode container

In order to use the Docker image you have just build or pulled use:

```
docker run -i -t --name namenode -h namenode 47deg/yarn-cluster /etc/bootstrap.sh -bash -namenode
```

You should now be able to access the Hadoop Admin UI at

http://<host>:8088/cluster

**Make sure that SELinux is disabled on the host. If you are using boot2docker you don't need to do anything.**

### Start an Apache Yarn datanode container

In order to add data nodes to the Apache Yarn cluster, use:

```
docker run -i -t --link namenode:namenode --dns=namenode 47deg/yarn-cluster /etc/bootstrap.sh -bash -datanode
```

You should now be able to access the HDFS Admin UI at

http://<host>:50070

**Make sure that SELinux is disabled on the host. If you are using boot2docker you don't need to do anything.**

### Testing

You can run one of the stock examples:

```
cd $HADOOP_PREFIX

# add input files
bin/hdfs dfs -mkdir -p /user/root
bin/hdfs dfs -put $HADOOP_PREFIX/etc/hadoop/ input

# run the mapreduce
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.4.0.jar grep input output 'dfs[a-z.]+'

# check the output
bin/hdfs dfs -cat output/*
```

## Acknowledgements

This docker image is based on @sequenceiq work, in his excellent repository https://github.com/sequenceiq/hadoop-docker .