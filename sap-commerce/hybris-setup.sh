#!/bin/sh

####options####
#1-default (everything - storefronts, hac, backoffice, etc.)
#2-backoffice only
#3-hac only
#4-occ only
#5-platform only (for initialize, update or running cronjobs)
###############

export ASPECT_ID=${1:-1}

echo "create hybris https secret"
kubectl apply -f ./sap-commerce/hybris-https-secret.yaml

echo "create hybris configmap"
kubectl apply -f ./sap-commerce/hybris-configmap.yaml

echo "create hybris service"
kubectl apply -f ./sap-commerce/hybris-service.yaml