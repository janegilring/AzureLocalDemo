targetScope = 'resourceGroup'

metadata name = 'Azure Local Logical Network deployment'
metadata description = 'Template for deploying logical networks'
metadata versionnumber = '1.0.0'

@description('Name of the custom location')
param customLocationName string = 'azlocal-location'

@description('Azure region where the resource will be deployed')
param location string = 'West Europe'

param networkName string = 'lnet-vms'

param addressPrefix string

param dnsServers array

param ipAllocationMethod string = 'Dynamic'

param vipPoolStart string

param vipPoolEnd string

param vlanId int

param gateway string

param vmSwitchName string = 'ConvergedSwitch(compute_management)'

@description('Calculate the resource ID for custom location')
var customLocationId = resourceId('Microsoft.ExtendedLocation/customLocations', customLocationName)

resource logicalNetwork 'Microsoft.AzureStackHCI/logicalNetworks@2024-08-01-preview' = {
  extendedLocation: {
    type: 'CustomLocation'
    name: customLocationId
  }
  location: location
  name: networkName
  properties: {
    dhcpOptions: {
      dnsServers: dnsServers
    }
    subnets: [
      {
        name: networkName
        properties: {
          addressPrefix: addressPrefix
          ipAllocationMethod: ipAllocationMethod
          vlan: vlanId
          ipPools: [
            {
              name: 'bicepIPPool'
              start: vipPoolStart
              end: vipPoolEnd
              ipPoolType: 'vippool'
            }
          ]
          routeTable: {
            properties: {
              routes: [
                {
                  name: 'defaultRoute'
                  properties: {
                    addressPrefix: '0.0.0.0/0'
                    nextHopIpAddress: gateway
                  }
                }
              ]
            }
          }
        }
      }
    ]
    vmSwitchName: vmSwitchName
  }
}
