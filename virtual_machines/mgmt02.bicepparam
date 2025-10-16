using 'main.bicep'

param name = 'mgmt02'

param location = 'westeurope'

param adminUsername = 'demoadmin'

param vCPUCount = 2

param memoryMB = 3072

param imageName = '2025-datacenter-edition'

param isMarketplaceImage = false

param hciLogicalNetworkName = 'lnet-vms'

param customLocationName = 'huboslo'

param domainToJoin = 'mtc.local'

param domainJoinUserName = 'demoadmin'

param domainTargetOu = 'ou=local-VMs,ou=oslohci,dc=mtc,dc=local'

