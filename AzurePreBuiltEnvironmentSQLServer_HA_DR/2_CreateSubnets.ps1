#Create The Virtual Network in Dublin
New-AzureRmVirtualNetwork -ResourceGroupName rgInfrastructure01 -Name VnetProductionDublin -AddressPrefix 192.168.0.0/16 -Location northeurope

#Create 2 different Subnets in Dublin to segment the workloads, one for the DCs and another one for SQL Server
$subnetDCs= New-AzureRmVirtualNetworkSubnetConfig -Name subnetProductionDublin -AddressPrefix 192.168.111.0/24
$subnetSQLs= New-AzureRmVirtualNetworkSubnetConfig -Name subnetProductionDublin -AddressPrefix 192.168.112.0/24


#Create VNet in Dublin with the 2 subnets specified above
New-AzureRmVirtualNetwork -ResourceGroupName rgInfrastructure01 -Name VnetProductionDublin -AddressPrefix 192.168.0.0/16 -Location northeurope -Subnet $subnetDCs
Add-AzureRmVirtualNetworkSubnetConfig -name subnetDublinProductionSQLServer -VirtualNetwork $VnetProductionDublin
#add SQL Server Subnet


New-AzureRmVirtualNetworkSubnetConfig -Name subnetSQLBackEndDublin -AddressPrefix 192.168.111.0/24

#Create Subnets in Dublin
New-AzureRmVirtualNetworkSubnetConfig -Name subnetProductionAmsterdam -AddressPrefix 192.168.102.0/24
New-AzureRmVirtualNetworkSubnetConfig -Name subnetSQLBackEndAmsterdam -AddressPrefix 192.168.112.0/24

