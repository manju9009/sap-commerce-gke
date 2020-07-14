#!/bin/sh

echo "creating hybris configmap"
kubectl apply -f hybris-configmap.yaml

echo "creating hybris stateful backoffice"
kubectl apply -f hybris-stateful-backoffice.yaml

echo "creating hybris backoffice service"
kubectl apply -f hybris-backoffice-service.yaml
