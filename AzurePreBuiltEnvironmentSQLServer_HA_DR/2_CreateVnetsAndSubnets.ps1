#https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview
# Not that I haven't used NetworkSecurityGroups (NSGs) just for simplicity on this implementation
# NSGs or NetworkVirtualAplicances can be used to filter inbout & outbound traffic


#Create The Virtual Network in Dublin
$vnetName= "VnetProductionWestEurope"
$Vnet = New-AzureRmVirtualNetwork -ResourceGroupName rgInfrastructure01 -Name $vnetName -AddressPrefix 192.168.0.0/16 -Location westeurope


#Create 2 different Subnets in West Europe to segment the workloads, one for the DCs and another one for SQL Servers/etc..
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name subnetDCWestEurope -AddressPrefix 192.168.111.0/24
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name subnetSQLWestEurope -AddressPrefix 192.168.112.0/24
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name subnetSQLBackendWestEurope -AddressPrefix 192.168.113.0/24
#must have this name for the VPN GatewaySubnet
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name GatewaySubnet -AddressPrefix 192.168.114.0/24
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name subnetStorage -AddressPrefix 192.168.115.0/24

# Set the goal state for the VNET
Set-AzureRmVirtualNetwork -VirtualNetwork $vnet

######
#Similar Architecture in West Central US
######

#Create The Virtual Network in WestCentralUS
$vnetName= "VnetProductionWestCentralUS"

$Vnet = New-AzureRmVirtualNetwork -ResourceGroupName rgInfrastructure02 -Name $vnetName -AddressPrefix 10.10.0.0/16 -Location WestCentralUS


#Create 2 different Subnets in Dublin to segment the workloads, one for the DCs and another one for SQL Server
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name subnetDCWestCentralUs -AddressPrefix 10.10.111.0/24
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name subnetSQLWestCentralUs -AddressPrefix 10.10.112.0/24
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name subnetSQLBackendWestCentralUs -AddressPrefix 10.10.113.0/24
#must have this name for the VPN GatewaySubnet
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name GatewaySubnet -AddressPrefix 10.10.114.0/24
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name subnetStorage -AddressPrefix 10.10.115.0/24


# Set the goal state for the VNET
Set-AzureRmVirtualNetwork -VirtualNetwork $vnet
