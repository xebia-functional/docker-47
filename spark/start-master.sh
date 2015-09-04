#!/usr/bin/env bash
docker pull 47deg/spark
docker run -d -t -p 7077:7077 -p 8080:8080 -P --name spark_master 47deg/spark /start-master.sh "$@"
