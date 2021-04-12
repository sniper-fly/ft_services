minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-65535

#install MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

eval $(minikube docker-env)

### create docker image
docker build -t rnakai/debug:v1 ./srcs/debug
docker build -t rnakai/nginx:v1 ./srcs/nginx
docker build -t rnakai/mysql:v1 ./srcs/mysql
docker build -t rnakai/wordpress:v1 ./srcs/wordpress


### create pod
kubectl apply -f ./srcs/debug/debug-pod.yml
kubectl apply -f ./srcs/nginx/nginx-pod.yml
kubectl apply -f ./srcs/mysql/mysql-pod.yml
kubectl apply -f ./srcs/wordpress/wordpress-pod.yml

