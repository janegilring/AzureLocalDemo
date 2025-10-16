using 'main.bicep'

param logAnalyticsWorkspaceName = 'LocalBox-Workspace'

param tenantId = '2c7c3c27-8b2c-4e5d-be73-03be7344c5cd'

param windowsAdminUsername = 'arcdemo'

param windowsAdminPassword = 'ArcPassword123!!'

param deployBastion = false

param spnProviderId = '75bac4d6-e2b9-4f59-beff-c7c7cb1c9f40'

param autoDeployClusterResource = true
param autoUpgradeClusterResource = false

param vmAutologon = true

param rdpPort = '443'

param enableAzureSpotPricing = false

param azureLocalInstanceLocation = 'australiaeast'

param githubAccount   = 'janegilring'

param githubBranch    = 'localbox_2509'
