#Create The Virtual Network in Dublin
$vnetName= "VnetProductionWestEurope"

$Vnet = New-AzureRmVirtualNetwork -ResourceGroupName rgInfrastructure01 -Name $vnetName -AddressPrefix 192.168.0.0/16 -Location westeurope

#Create 2 different Subnets in Dublin to segment the workloads, one for the DCs and another one for SQL Server
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name subnetDCWestEurope -AddressPrefix 192.168.111.0/24
Add-AzureRmVirtualNetworkSubnetConfig  -VirtualNetwork $Vnet -Name subnetSQLWestEurope -AddressPrefix 192.168.112.0/24

# Write Changes
Set-AzureRmVirtualNetwork -VirtualNetwork $vnet
