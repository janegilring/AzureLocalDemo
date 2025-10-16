
$aks_cluster_name = "aks-hub-oslo"
$resource_group = "rg-az-local-oslo-prod"
az connectedk8s proxy --name $aks_cluster_name --resource-group $resource_group

kubectl get nodes

kubectl get pods -n kube-system

az aksarc show -n $aks_cluster_name -g $resource_group

az deployment group what-if --resource-group $resource_group --template-file main.bicep --parameters main.bicepparam
az group deployment create --resource-group $resource_group --template-file main.bicep --parameters main.bicepparam

$subId = az account show --query id -o tsv

az extension add -n k8s-runtime --upgrade
az k8s-runtime load-balancer enable --resource-uri subscriptions/$subId/resourceGroups/$resource_group/providers/Microsoft.Kubernetes/connectedClusters/$aks_cluster_name

$lbName = "huboslo-lb"
$ipRange = "10.47.176.170-10.47.176.175"
$advertiseMode = "ARP"
az k8s-runtime load-balancer create --load-balancer-name $lbName --resource-uri subscriptions/$subId/resourceGroups/$resource_group/providers/Microsoft.Kubernetes/connectedClusters/$aks_cluster_name --addresses $ipRange --advertise-mode $advertiseMode
