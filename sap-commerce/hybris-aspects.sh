#!/bin/sh

####aspect options####
#1-default (everything - storefronts, hac, backoffice, etc.)
#2-backoffice only
#3-hac only
#4-occ only
#5-platform only (for initialize, update or running cronjobs)
###############

####usage####
#sh hybris-aspects <aspect option>
###############

####examples####
#sh hybris-aspects 1 # 'creates a storefront node'
#sh hybris-aspects 2 # 'creates a backoffice node'
#sh hybris-aspects 3 # 'creates a HAC node'
#sh hybris-aspects 4 # 'creates a OCC node'
#sh hybris-aspects 5 # 'creates a node to run a process like update, run cronjobs, etc'
###############

export ASPECT_ID=${1:-1}

if [ "$ASPECT_ID" = "1" ]; then
	echo "create hybris stateful storefront"
	kubectl apply -f ./sap-commerce/hybris-stateful-storefront.yaml
elif [ "$ASPECT_ID" = "2" ]; then
	echo "create hybris stateful backoffice"
	kubectl apply -f ./sap-commerce/hybris-stateful-backoffice.yaml
elif [ "$ASPECT_ID" = "3" ]; then
	echo "create hybris stateful hac"
	kubectl apply -f ./sap-commerce/hybris-stateful-hac.yaml
elif [ "$ASPECT_ID" = "4" ]; then
	echo "create hybris stateful occ"
	kubectl apply -f ./sap-commerce/hybris-stateful-occ.yaml
elif [ "$ASPECT_ID" = "5" ]; then
	echo "create hybris stateful admin"
	kubectl apply -f ./sap-commerce/hybris-stateful-platform.yaml
fi