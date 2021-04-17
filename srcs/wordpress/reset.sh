#!/bin/sh

kubectl delete -f wordpress-pod.yml
kubectl delete -f  ../mysql/mysql-pod.yml
eval $(minikube docker-env)
while true
do
	docker rmi rnakai/wordpress:v1 && break
	sleep 4
done
docker build -t rnakai/wordpress:v1 .
kubectl apply -f wordpress-pod.yml
kubectl apply -f ../mysql/mysql-pod.yml
