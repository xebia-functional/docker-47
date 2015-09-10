# Zookeeper Docker Image

This repository contains a set of scripts and configuration files to run [Zookeeper 3.4.6](https://zookeeper.apache.org/) into a [Docker](https://www.docker.io/) container.

## Installation

[Docker](https://www.docker.com/)

## Build Docker Image

    docker build -t 47deg/zookeeper .
    
## Push Image

    docker push 47deg/zookeeper
    
## Run

```
docker run -d --name zookeeper 47deg/zookeeper
```
