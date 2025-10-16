using 'main.bicep'

param name = 'mgmt01-qa'

param location = 'australiaeast'

param adminUsername = 'demoadmin'

param adminPassword = 'ArcPassword123!!'

param vCPUCount = 2

param memoryMB = 3072

param imageName = '2404-ubuntu'

param isMarketplaceImage = false

param hciLogicalNetworkName = 'lnet-vms'

param customLocationName = 'qahuboslo'

param enableEntraIdLoginForLinux = true

//param domainToJoin = ''

//param domainJoinUsername = ''

//param domainJoinPassword = ''
