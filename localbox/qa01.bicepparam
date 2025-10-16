using 'main.bicep'

param logAnalyticsWorkspaceName = 'LocalBox-Workspace'

param tenantId = '2ffc1db7-b373-4be0-a5ec-f54edd5bf695' // HCI tenant

param windowsAdminUsername = 'arcdemo'

param windowsAdminPassword = 'ArcPassword123!!'

param deployBastion = false

param spnProviderId = 'aa8675e0-63de-4c2e-a00c-24197a131d15' // HCI tenant

param autoDeployClusterResource = true
param autoUpgradeClusterResource = false

param vmAutologon = true

param rdpPort = '443'

param enableAzureSpotPricing = false

param azureLocalInstanceLocation = 'australiaeast'
