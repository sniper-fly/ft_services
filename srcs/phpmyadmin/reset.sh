#!/bin/sh

eval $(minikube docker-env)
kubectl delete pod phpmyadmin-pod
docker rmi rnakai/phpmyadmin:v1
docker build -t rnakai/phpmyadmin:v1 .
kubectl apply -f phpmyadmin-pod.yml
