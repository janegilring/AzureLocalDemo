using 'main.bicep'

param location = 'australiaeast'

param vlanId = 110

param customLocationName = 'jumpstart'

param networkName = 'lnet-aks'

param vmSwitchName = 'ConvergedSwitch(hci)'

param addressPrefix = '10.10.0.0/24'

param dnsServers = ['192.168.1.254']

param ipAllocationMethod = 'Static'

param vipPoolStart = '10.10.0.101'

param vipPoolEnd = '10.10.0.199'

param gateway = '10.10.0.1'
