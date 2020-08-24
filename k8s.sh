#/bin/bash

kubectl run # (changing to be only for pod creation)
kubectl create # (create some resources via CLI or YAML)
kubectl apply # (create/update anything via YAML)

# (OLD Version) kubectl run my-app --image exilemirror/react-eks:16
kubectl create deployment my-app --image exilemirror/react-eks:16
kubectl get pods
kubectl get all # See all objects)\
kubectl delete deployment <deploymentName>

#### SCALING REPLICAS ####
kubectl scale deploy/my-app --replicas=3

#### Inspecting Deployment ####
kubectl logs deploy/my-app
kubectl logs deploy/my-app --follow --tail 1
kubectl describe pod/my-app-6b5c475545-n6md2

kubectl get pods -w

#### Exposing Containers ####
# Create cluster IP
kubectl expose deploy/my-app --port 80

# Create NodePort serivce
kubectl expose deploy/my-app --name my-app-np --type NodePort --port 80

# Create LoadBalancer
kubectl expose deploy/my-app --name my-app-lb --type LoadBalancer --port 80

# Services
kubectl get service
kubectl delete service/my-app service/my-app-np service/my-app-lb