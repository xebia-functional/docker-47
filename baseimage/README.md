# Base Docker Image

## Installation

[Docker](https://www.docker.com/)

## Build Docker Image

	docker build -t 47deg/baseimage .

## Run

	docker run -it --rm 47deg/baseimage wget --help

## Push Image

	docker push 47deg/baseimage
