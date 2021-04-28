#!/bin/sh

eval $(minikube docker-env)
kubectl delete -f influxdb-pod.yml
while [ 1 ]
do
	docker rmi rnakai/influxdb:v1 && break
	sleep 5
done
docker build -t rnakai/influxdb:v1 .
kubectl apply -f influxdb-pod.yml
