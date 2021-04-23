#!/bin/sh

eval $(minikube docker-env)
kubectl delete -f ftps-pod.yml
while [ 1 ]
do
	docker rmi rnakai/ftps:v1 && break
	sleep 5
done
docker build -t rnakai/ftps:v1 .
kubectl apply -f ftps-pod.yml
