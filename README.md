# AKS Upgrade Scripts

Shell script for upgrading an Azure Kubernetes Service (AKS) cluster.

### Prerequisites

In order to use this scipt, you need:

- `az` with active login session to the subsciption

### Execute

Set the following environment variables:

| Name | Desscription |
| --- | --- |
| AZURE_SUBSCRIPTION | Azure subscription Id | 
| AKS_RESOURCE_GROUP | Azure resource group containing your AKS cluster |
| AKS_CLUSTER_NAME | Your AKS cluster name to upgrade |

Execute

```
source <(curl -s https://raw.githubusercontent.com/pacroy/aks-upgrade/master/upgrade.sh)
```