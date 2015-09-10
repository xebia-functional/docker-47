# Kakfa Cluster Docker Image

This repository contains a set of scripts and configuration files to run a [Apache Kafka](http://kafka.apache.org/) cluster from [Docker](https://www.docker.io/) container.

## Installation

[Docker](https://www.docker.com/)

## Build Docker Image

    docker build -t 47deg/kafka .
    
## Push Image

    docker push 47deg/kafka
    
## Run

The best way to run kafka is using [docker-compose](https://docs.docker.com/compose/install/). You could create a `docker-compose.yml` like this:

```
zookeeper:
  image: 47deg/zookeeper
  ports: 
    - "2181"
kafka:
  image: 47deg/kafka
  ports:
    - "9092"
  links: 
    - zookeeper:zk
  environment:
    KAFKA_ADVERTISED_HOST_NAME: 192.168.99.100
  volumes:
    - /var/run/docker.sock:/var/run/docker.sock
```

Once you have defined that, you could start a cluster:

```
docker-compose up -d
```

Add more brokers:

```
docker-compose scale kafka=3
```

Destroy a cluster:

```
docker-compose stop
```

By default each broker will get a new port number and broker id on restart. Depending on your use case this might not be desirable. In that case you will need to attach the different brokers to an specific port, for example: 

```
  ports:
    - "9092"
```

## Broker IDs

If you don't specify a broker id in your docker-compose file, it will automatically be generated based on the name that docker-compose gives the container. This allows scaling up and down. In this case it is recommended to use the ```--no-recreate``` option of docker-compose to ensure that containers are not re-created and thus keep their names and ids.


## Automatically create topics

If you want to have kafka-docker automatically create topics in Kafka during
creation, a ```KAFKA_CREATE_TOPICS``` environment variable can be
added in ```docker-compose.yml```.

Here is an example snippet from ```docker-compose.yml```:

        environment:
          KAFKA_CREATE_TOPICS: "Topic1:1:3,Topic2:1:1"

```Topic 1``` will have 1 partition and 3 replicas, ```Topic 2``` will have 1 partition and 1 replica.

## Custom Parameters

If you want to customise any Kafka parameters, simply add them as environment variables in ```docker-compose.yml```, e.g. in order to increase the ```message.max.bytes``` parameter set the environment to ```KAFKA_MESSAGE_MAX_BYTES: 2000000```. To turn off automatic topic creation set ```KAFKA_AUTO_CREATE_TOPICS_ENABLE: 'false'```.

## Acknowledgements

This docker image is based on @wurstmeister work, in his excellent repository https://github.com/wurstmeister/kafka-docker
