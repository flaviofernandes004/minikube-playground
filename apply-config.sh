#!/bin/bash

export MINIKUBE_IP=$(minikube ip)
echo $MINIKUBE_IP

FILES=$(find . -name '*.yaml')

for file in $FILES; do
  echo $file
  manifest=$(envsubst < $file)
  echo "$manifest" | kubectl apply -f -
done

