# Spark Standalone Cluster Docker Image

This repository contains a set of scripts and configuration files to run a [Apache Spark](https://spark.apache.org/) standalone cluster from [Docker](https://www.docker.io/) container.

* Spark 1.5.1
* Scala 2.11
* Pre-built for Hadoop 2.4.0

## Installation

[Docker](https://www.docker.com/)

## Build Docker Image

    docker build -t 47deg/spark:1.5.1 .

## Push Image

    docker push 47deg/spark:1.5.1

## Run

To run a Spark Master node:

```
docker run -d -t \
-p 7077:7077 \
-p 8080:8080 \
--name spark_master \
47deg/spark:1.5.1 \
/start-master.sh "$@"
```

To run a worker node:

```
docker run -d -t -P  \
--name spark_worker_1 \
--link spark_master:spark_master  \
47deg/spark:1.5.1  \
/start-worker.sh "$@"
```

You can run multiple workers. Every worker would be able to find master by its container name **spark_master**.


## Acknowledgements

This docker image is based on @epahomov work, in his excellent repository https://github.com/epahomov/docker-spark 