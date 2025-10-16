using 'main.bicep'

param name = 'mgmt01'

param location = 'westeurope'

param adminUsername = 'demoadmin'

param adminPassword = 'ArcPassword123!!'

param vCPUCount = 2

param memoryMB = 3072

param imageName = 'ubuntu-2404'

param isMarketplaceImage = false

param hciLogicalNetworkName = 'lnet-vms'

param customLocationName = 'huboslo'

param enableEntraIdLoginForLinux = true

//param domainToJoin = ''

//param domainJoinUsername = ''

//param domainJoinPassword = ''
