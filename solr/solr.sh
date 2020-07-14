#!/bin/sh

echo "create config map for master and slave"
kubectl apply -f ./solr/solr-configmap-master.yaml
kubectl apply -f ./solr/solr-configmap-slave.yaml

echo "create stateful set for master and slave"
kubectl apply -f ./solr/solr-stateful-master.yaml
kubectl apply -f ./solr/solr-stateful-slave.yaml

echo "create service for master and slave"
kubectl apply -f ./solr/solr-service-master.yaml
kubectl apply -f ./solr/solr-service-slave.yaml
