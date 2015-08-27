# Java 7 Docker Image

## Installation

[Docker](https://www.docker.com/)

## Build Docker Image

	docker build -t 47deg/java7 .
	
## Run

	docker run -it --rm 47deg/java7 java -version
	
## Push Image

	docker push 47deg/java7