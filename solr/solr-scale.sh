#!/bin/sh

export REPLICAS=${1}

####usage####
# sh solr-scale 3 - scales slaves  to 3
###############

#note: only solr slaves can be scaled as there would be only one master
echo "scale solr-stateful-slav to $REPLICAS replicas"
kubectl scale statefulsets solr-stateful-slave --replicas=$REPLICAS
