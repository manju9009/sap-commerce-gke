#!/bin/sh

export PROJECT=$(gcloud config get-value project)
export CLUSTER=sapcommerce-cluster

#n1-standard-8 = (8 vCPUSs, 30GB)
export GCP_MACHINE_TYPE=n1-standard-8

echo "set project $PROJECT"
gcloud config set project $PROJECT

echo "create zonal cluster $CLUSTER (machine-type - $GCP_MACHINE_TYPE (8 vCPUSs, 30GB), number of nodes - 3)"
gcloud container clusters create $CLUSTER --machine-type=$GCP_MACHINE_TYPE --enable-stackdriver-kubernetes

gcloud container clusters describe $CLUSTER