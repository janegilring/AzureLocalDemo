using 'main.bicep'

param name = 'mgmt02'

param location = 'australiaeast'

param adminUsername = 'demoadmin'

param vCPUCount = 2

param memoryMB = 3072

param imageName = '2025-datacenter-edition'

param isMarketplaceImage = false

param hciLogicalNetworkName = 'lnet-vms'

param customLocationName = 'jumpstart'

param domainToJoin = 'jumpstart.local'

param domainJoinUserName = 'arcdemo'

param domainTargetOu = 'ou=local-VMs,dc=jumpstart,dc=local'
