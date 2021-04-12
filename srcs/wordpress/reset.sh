#!/bin/sh

kubectl delete pod wordpress-pod mysql-pod
eval $(minikube docker-env)
docker rmi rnakai/wordpress:v1
docker build -t rnakai/wordpress:v1 .
kubectl apply -f wordpress-pod.yml
kubectl apply -f ../mysql/mysql-pod.yml
