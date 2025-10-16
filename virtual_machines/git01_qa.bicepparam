using 'main.bicep'

param name = 'git01-qa'

param location = 'australiaeast'

param adminUsername = 'demoadmin'

param adminPassword = 'ArcPassword123!!'

param vCPUCount = 2

param memoryMB = 4096

param imageName = '2404-ubuntu'

param isMarketplaceImage = false

param hciLogicalNetworkName = 'lnet-vms'

param customLocationName = 'qahuboslo'

param dataDiskParams = [
  {
    diskSizeGB: 20
    dynamic: true
  }
]

//param domainToJoin = ''

//param domainJoinUsername = ''

//param domainJoinPassword = ''
