#!/bin/sh

eval $(minikube docker-env)
kubectl delete -f grafana-pod.yml
while [ 1 ]
do
	docker rmi rnakai/grafana:v1 && break
	sleep 5
done
docker build -t rnakai/grafana:v1 .
kubectl apply -f grafana-pod.yml
