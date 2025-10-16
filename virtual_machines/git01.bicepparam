using 'main.bicep'

param name = 'git01'

param location = 'westeurope'

param adminUsername = 'demoadmin'

param adminPassword = 'ArcPassword123!!'

param vCPUCount = 2

param memoryMB = 4096

param imageName = 'ubuntu-2404'

param isMarketplaceImage = false

param hciLogicalNetworkName = 'lnet-vms'

param customLocationName = 'huboslo'

param dataDiskParams = [
  {
    diskSizeGB: 20
    dynamic: true
  }
]

//param domainToJoin = ''

//param domainJoinUsername = ''

//param domainJoinPassword = ''
