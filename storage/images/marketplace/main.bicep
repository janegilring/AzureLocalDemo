targetScope = 'resourceGroup'

metadata name = 'Azure Local Image deployment'
metadata description = 'Template for deploying Arc Image for Azure Local VM'
metadata versionnumber = '1.0.0'

@description('Name of the custom location')
param customLocationName string = 'azlocal-location'

@description('Azure region where the resource will be deployed')
param location string = 'West Europe'

param imageName string = 'image-w25-smalldisk'
@allowed([ 'Windows' ])
param osType string = 'Windows'
@allowed([
  'microsoftwindowsserver:windowsserver:2025-datacenter-azure-edition-smalldisk' ])
param imageURN string
param skuVersion string = '26100.2033.241205'
@allowed([ 'V2' ])
param hyperVGeneration string = 'V2'

@description('Split the image URN into parts')
var publisherId = split(imageURN, ':')[0]
var offerId = split(imageURN, ':')[1]
var planId = split(imageURN, ':')[2]

@description('Calculate the resource ID for custom location')
var customLocationId = resourceId('Microsoft.ExtendedLocation/customLocations', customLocationName)

resource image 'Microsoft.AzureStackHCI/marketplaceGalleryImages@2023-09-01-preview' = {
  name: imageName
  location: location
  extendedLocation: {
    name: customLocationId
    type: 'CustomLocation'
  }
  properties: {
    osType: osType
    hyperVGeneration: hyperVGeneration
    identifier: {
      publisher: publisherId
      offer: offerId
      sku: planId
    }
    version: {
      name: skuVersion
    }
  }
  tags: {}
}
