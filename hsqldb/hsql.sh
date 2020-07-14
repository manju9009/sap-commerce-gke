#!/bin/sh

echo "create hsql stateful deployment and service"
kubectl apply -f ./hsqldb/hsql-stateful.yaml
kubectl apply -f ./hsqldb/hsql-service.yaml