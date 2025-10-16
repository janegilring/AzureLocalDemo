using './main.bicep'

param ClusterName = 'aks-hub-oslo-qa'
param location = 'australiaeast'
param aksControlPlaneNodeSize = 'Standard_A4_v2'
param aksControlPlaneNodeCount = 3
param aksControlPlaneIP = '10.10.0.200'
param aksNodePoolName = 'nodepool1'
param aksNodePoolNodeSize = 'Standard_A2_v2'
param aksNodePoolNodeCount = 2
param aksNodePoolOSType = 'Linux'
param SSHPublicKey = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlc8e+B25gC7nIpmyukTEGw04zzf+UWpJC2Jp/sU6AJVE37+wNKkq1rsW05pQ58F4CjUiCgdWQ1RCAGDVAm5NatoxFWLO2Hd9yYL9cv5mQhbYflF4XqgsUq5BO5sbDNW4pKjSkW/Im1YU+BsLQ/K93oF0LJhEfc4PIZjmBKI/8yxj3fRrh83pugcy67EwVqshae4UhthTNwESSy3NFx7peniTQclokUK/JAHF4YmWuBzBXeVAe8HNnFUveGWsHVFj1s9fSpOhJ0ZuuDp280l/vDR9R4DwCXCk4lQ4rR6nJtrD7Cb5dkS1JSQ4h1AZWK5g4Qv/9JCL4DDi+WbIFq49/a2RJNqGt0A01NQzpSkOuY0yz9O2fS9pOW3TXYbyL7cI8uoBBAY9KYl1t19HVQaAUKiK1PGGy4DQIvZENTsO2iJhlPYoUJcX1mwtiE1n4VM6P3clfq7yrBmIsxpk0om50FPHKJhD23QQ9L9ZBL6luvemQ1lHBtdswdrU5QRHnzeU= generated-by-azure'
param LogicalNetworkName = 'lnet-aks'
param CustomLocationName = 'qahuboslo'
param aksKubernetesVersion = 'v1.29.4'
