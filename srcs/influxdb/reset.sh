#!/bin/sh

eval $(minikube docker-env)
docker build -t rnakai/influxdb:v1 .
