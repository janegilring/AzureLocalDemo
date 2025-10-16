using './main.bicep'

param ClusterName = 'aks-oslo-qa'
param location = 'australiaeast'
param aksControlPlaneNodeSize = 'Standard_A4_v2'
param aksControlPlaneNodeCount = 3
param aksControlPlaneIP = '10.10.0.200'
param aksNodePoolName = 'nodepool1'
param aksNodePoolNodeSize = 'Standard_A2_v2'
param aksNodePoolNodeCount = 2
param aksNodePoolOSType = 'Linux'
param SSHPublicKey = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDwgw5SRC10Lb+OQzoMuNyXPQUlBnQEYWY/iRUAL3WwCKKzQiGKIR8v4UnXrQooPPGe2JNZopmWmsqZnwZoGtwGs+36OdFQArKE8XRPXNQRXedOSZb0xZsOKHRom+GBP5nzV3lZz3mzJvgW/RVlwrgMpzz+dZ1Lo4ZMeiR3xmlkN/HEZX5Bznw3TGOHtoAqtzFthP3PDtZsdzPOiqxGKHgPiwDn8E03Dsr/9iwrLzL/VI/L+o72OHBWciZWviaGih028DJWp2KcOcJalOGx9rZQMr3coNYe/fE0e3JMD+yD7X+J7cVwsVyFdlT0NU6mItwnAii5SKV6NsFF8DxbRNHdOOSFWBl7GaQKcidu7RmuUYjp9mlsdB+5vdrPqbX5ASPE6ha7IguXceqHCnYN9CY4/Lfi48ZybcqN8sd1pd0WU9b7Hzo/dhpAwaN5Qhe2Uh55/0qbt1pk1RBn3/H405gRM9VckFO5S5NfoFT/8O4Voc4UqdEc97VJ0YnpbbItZUc='
param LogicalNetworkName = 'lnet-aks'
param CustomLocationName = 'jumpstart'
param aksKubernetesVersion = 'v1.30.9'
