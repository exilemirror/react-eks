#/bin/bash

kubectl create deployment my-app --image exilemirror/react-eks:16
kubectl scale deploy/my-app --replicas=3

# Verify
kubectl get pods -l 'app=my-app' -o wide | awk {'print $1" " $3 " " $6'} | column -t

# Create LB service
kubectl expose deployment my-app --type=LoadBalancer --name=my-app-lb --port 8888
kubectl describe services my-app-lb
# Create NP service
# Check public IP
kubectl get nodes -o wide |  awk {'print $1" " $2 " " $7'} | column -t