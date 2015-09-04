#!/usr/bin/env bash
docker pull 47deg/spark
docker run -d -t -P --link spark_master:spark_master 47deg/spark /start-worker.sh "$@"
