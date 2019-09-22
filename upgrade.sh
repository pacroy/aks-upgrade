#!/bin/bash
set -e

# Parameters
[ -z "$AZURE_SUBSCRIPTION" ] && echo "ERROR: Environment variable AZURE_SUBSCRIPTION is not set" && exit 1
[ -z "$AKS_RESOURCE_GROUP" ] && echo "ERROR: Environment variable AKS_RESOURCE_GROUP is not set" && exit 1
[ -z "$AKS_CLUSTER_NAME" ] && echo "ERROR: Environment variable AKS_CLUSTER_NAME is not set" && exit 1

# Check upgradable versions
az aks get-upgrades --subscription $AZURE_SUBSCRIPTION --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --output table

# Input
read -p "Upgrade to version: "  to_version

# Upgrade AKS cluster
az aks upgrade --yes --subscription $AZURE_SUBSCRIPTION --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --kubernetes-version $to_version

# Check current version
az aks show --subscription $AZURE_SUBSCRIPTION --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --output table