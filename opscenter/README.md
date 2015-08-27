# Cassandra OpsCenter Docker Image

Based on Cassandra Datastax OpsCenter, version 5.2.0.

## Installation

[Docker](https://www.docker.com/)

## Build Docker Image

	docker build -t 47deg/opscenter .
    
## Push Image

    docker push 47deg/opscenter
	
## Run

### Opscenter

By default:

	docker run -d --name opscenter abh1nav/opscenter:latest

You may also want to expose OpsCenter service ports:

    docker run -d --name opscenter -p 8888:8888 -p 61620:61620 abh1nav/opscenter:latest

## Acknowledgements

This docker image is based on @abh1nav work, in his excellent repository https://github.com/abh1nav/docker-opscenter . 