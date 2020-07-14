#!/bin/sh

####options####
#1-default (everything - storefronts, hac, backoffice, etc.)
#2-backoffice only
#3-hac only
#4-occ only
###############

####usage####
#sh hybris-scale <desired num of replicas> <ascpect option>
###############

####examples####
#sh hybris-scale 3 or sh hybris-scale 3 1 # 'scales storefronts statefulsets to 3'
#sh hybris-scale 2 2 # 'scales backoffice statefulsets to 2'
#sh hybris-scale 2 3 # 'scales hac statefulsets to 2'
#sh hybris-scale 3 4 # 'scales occ statefulsets to 3'
###############

export REPLICAS=${1}
export ASPECT_ID=${2:-1}

#create stateful set
if [ "$ASPECT_ID" = "1" ]; then
	echo "scale hybris-stateful-storefront to $REPLICAS replicas"
	kubectl scale statefulsets hybris-stateful-storefront --replicas=$REPLICAS
elif [ "$ASPECT_ID" = "2" ]; then
	echo "scale hybris-stateful-backoffice to $REPLICAS replicas"
	kubectl scale statefulsets hybris-stateful-backoffice --replicas=$REPLICAS
elif [ "$ASPECT_ID" = "3" ]; then
	echo "scale hybris-stateful-hac to $REPLICAS replicas"
	kubectl scale statefulsets hybris-stateful-hac --replicas=$REPLICAS
elif [ "$ASPECT_ID" = "4" ]; then
	echo "scale hybris-stateful-occ to $REPLICAS replicas"
	kubectl scale statefulsets hybris-stateful-occ --replicas=$REPLICAS
fi