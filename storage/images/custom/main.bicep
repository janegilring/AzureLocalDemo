targetScope = 'resourceGroup'

metadata name = 'Azure Local Image deployment'
metadata description = 'Template for deploying Arc Image for Azure Local VM'
metadata versionnumber = '1.0.0'

@description('Name of the custom location')
param customLocationName string = 'azlocal-location'

@description('Azure region where the resource will be deployed')
param location string = 'West Europe'

param imageName string = 'image-w25-smalldisk'
@allowed([ 'Linux','Windows'])
param osType string = 'Linux'
param imagePath string
@allowed([ 'V2' ])
param hyperVGeneration string = 'V2'

@description('Calculate the resource ID for custom location')
var customLocationId = resourceId('Microsoft.ExtendedLocation/customLocations', customLocationName)

resource image 'Microsoft.AzureStackHCI/galleryImages@2024-01-01' = {
  name: imageName
  location: location
  extendedLocation: {
    name: customLocationId
    type: 'CustomLocation'
  }
  properties: {
    osType: osType
    hyperVGeneration: hyperVGeneration
    imagePath: imagePath
  }
}
