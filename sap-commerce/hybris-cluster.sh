#!/bin/sh

echo "create hybris cluster - 2 storefront nodes, 1 backoffice node"

echo "create hybris stateful storefront (2 replicas configured creates 2 nodes)"
kubectl apply -f ./sap-commerce/hybris-stateful-storefront.yaml

echo "create hybris stateful backoffice"
kubectl apply -f ./sap-commerce/hybris-stateful-backoffice.yaml

#the above also can be run as below
#create storefront node
# sh ./sap-commerce/hybris-aspects 1
#create a backoffice node
# sh ./sap-commerce/hybris-aspects 2

echo "create hybris service"
kubectl apply -f ./sap-commerce/hybris-service.yaml