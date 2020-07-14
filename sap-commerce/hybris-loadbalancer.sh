#!/bin/sh

echo "create hybris load balancer"
echo "WARNING: load balancer is subject to billing"
kubectl apply -f ./sap-commerce/hybris-service-lb.yaml