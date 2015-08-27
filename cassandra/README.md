# Cassandra Docker Image

Based on Cassandra Datastax, version 2.1.8.

## Installation

[Docker](https://www.docker.com/)

## Build Docker Image

	docker build -t 47deg/cassandra .
    
## Push Image

    docker push 47deg/cassandra
	
## Run

### Opscenter

	docker run -d --name opscenter 47deg/opscenter

To get the OpsCenter IP from the container:

    OPS_IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' opscenter)    

### Running Cassandra Nodes

3 Cassandra nodes for instance, would be launched in this way:

    docker run -d -p 9042:9042 --name cass1 -e OPS_IP=$OPS_IP 47deg/cassandra
    sleep $DEFAULT_SLEEP

    docker run -d -p 9042:9042 --name cass2 -e OPS_IP=$OPS_IP 47deg/cassandra
    sleep $DEFAULT_SLEEP

    docker run -d -p 9042:9042 --name cass3 -e OPS_IP=$OPS_IP 47deg/cassandra
    sleep $DEFAULT_SLEEP

## Acknowledgements

This docker image is based on @abh1nav work, in his excellent repository https://github.com/abh1nav/docker-cassandra . 