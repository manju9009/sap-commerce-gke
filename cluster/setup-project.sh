#!/bin/sh

export PROJECT_NAME=${1:-valtech-sapcommerce}
export PROJECT=$(gcloud config get-value project)
export ZONE=us-east4-a

#Run 'gcloud alpha billing accounts list' command and pass it as argument to billing id below
export ACCOUNT_ID=$2


if [ "$PROJECT" != "$PROJECT_NAME" ]; then
	echo "Project not found"
	export PROJECT=$PROJECT_NAME
	echo "create project $PROJECT"
	gcloud projects create $PROJECT
	gcloud config set project $PROJECT
fi

echo "set compute zone $ZONE ..."
gcloud config set compute/zone $ZONE

echo "update gcloud to the latest version"
sudo /google/google-cloud-sdk/bin/gcloud components update

if [ ! -z "$ACCOUNT_ID" ]; then
	echo "enable billing for project $PROJECT "
	gcloud beta billing projects link "$PROJECT" --billing-account="$ACCOUNT_ID"
fi

echo "enable Kubernetes engine API"
gcloud services enable container.googleapis.com
