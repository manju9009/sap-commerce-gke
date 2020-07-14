#!/bin/sh

export COMPANY=valtech
export PROJECT=$(gcloud config get-value project)
export ZONE=us-east4-a
export CLUSTER=sapcommerce-cluster

echo "set compute zone $ZONE"
gcloud config set compute/zone $ZONE

echo "update gcloud to the latest version"
sudo /google/google-cloud-sdk/bin/gcloud components update

echo "delete cluster"
gcloud container clusters delete $CLUSTER

echo "list clusters"
gcloud container clusters list