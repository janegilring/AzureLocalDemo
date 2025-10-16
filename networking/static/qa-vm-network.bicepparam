using 'main.bicep'

param location = 'australiaeast'

param vlanId = 200

param customLocationName = 'jumpstart'

param networkName = 'lnet-vms'

param vmSwitchName = 'ConvergedSwitch(hci)'

param addressPrefix = '192.168.200.0/24'

param dnsServers = ['192.168.1.254']

param ipAllocationMethod = 'Static'

param vipPoolStart = '192.168.200.101'

param vipPoolEnd = '192.168.200.199'

param gateway = '192.168.200.1'
