#West Europe
$RG1 ="rgInfrastructure01"
$Location1 = "WestEurope"
$VNetName1 ="VnetProductionWestEurope"
$GWIPconfName1 = "gwipconf1"
$GWName1 = "VnetProductionWestEuropeGW"
$GWIPName1 = "VnetProductionWestEuropeGWIP"

#New Public IP to be allocated to the gateway of the VNET
$gwpip1 = New-AzureRmPublicIpAddress -Name $GWIPName1 -ResourceGroupName $RG1 `
-Location $Location1 -AllocationMethod Dynamic

#Create Gateway Config
$vnet1 = Get-AzureRmVirtualNetwork -Name $VNetName1 -ResourceGroupName $RG1
$subnet1 = Get-AzureRmVirtualNetworkSubnetConfig -Name "GatewaySubnet" -VirtualNetwork $vnet1
$gwipconf1 = New-AzureRmVirtualNetworkGatewayIpConfig -Name $GWIPconfName1 `
-Subnet $subnet1 -PublicIpAddress $gwpip1

#Create the gateway for the Vnet, should take less than 1 hour to complete
New-AzureRmVirtualNetworkGateway -Name $GWName1 -ResourceGroupName $RG1 `
-Location $Location1 -IpConfigurations $gwipconf1 -GatewayType Vpn `
-VpnType RouteBased -GatewaySku Standard

#REPEAT FOR West Central Us
#West Central Us
$RG2 ="rgInfrastructure02"
$Location2 = "WestCentralUs"
$VNetName2 ="VnetProductionWestCentralUs"
$GWIPconfName2 = "gwipconf2"
$GWName2 = "VnetProductionWestCentralUsGW"
$GWIPName2 = "VnetProductionWestCentralUsGWIP"

#New Public IP to be allocated to the gateway of the VNET
$gwpip2 = New-AzureRmPublicIpAddress -Name $GWIPName2 -ResourceGroupName $RG2 `
-Location $Location2 -AllocationMethod Dynamic

#Create Gateway Config

$vnet2 = Get-AzureRmVirtualNetwork -Name $VNetName2 -ResourceGroupName $RG2
$subnet2 = Get-AzureRmVirtualNetworkSubnetConfig -Name "GatewaySubnet" -VirtualNetwork $vnet2
$gwipconf2 = New-AzureRmVirtualNetworkGatewayIpConfig -Name $GWIPconfName2 `
-Subnet $subnet2 -PublicIpAddress $gwpip2

#Create the gateway for the Vnet, should take less than 1 hour to complete
New-AzureRmVirtualNetworkGateway -Name $GWName2 -ResourceGroupName $RG2 `
-Location $Location2 -IpConfigurations $gwipconf2 -GatewayType Vpn `
-VpnType RouteBased -GatewaySku Standard

#Create and establish the connection!

$vnet1gw = Get-AzureRmVirtualNetworkGateway -Name $GWName1 -ResourceGroupName $RG1
$vnet2gw = Get-AzureRmVirtualNetworkGateway -Name $GWName2 -ResourceGroupName $RG2

$Connection12="VnetWestEuropeToVnetWestCentralUs"
$Connection21="VnetWestCentralUsToWestEurope"

#Create connection from vnet1 (West Europe) to vnet2 (West Central Us)
New-AzureRmVirtualNetworkGatewayConnection -Name $Connection12 -ResourceGroupName $RG1 `
-VirtualNetworkGateway1 $vnet1gw -VirtualNetworkGateway2 $vnet2gw -Location $Location1 `
-ConnectionType Vnet2Vnet -SharedKey 'SharedKeyAzurePCondeca'

New-AzureRmVirtualNetworkGatewayConnection -Name $Connection21 -ResourceGroupName $RG2 `
-VirtualNetworkGateway1 $vnet2gw -VirtualNetworkGateway2 $vnet1gw -Location $Location2 `
-ConnectionType Vnet2Vnet -SharedKey 'SharedKeyAzurePCondeca'

#See Status
Get-AzureRmVirtualNetworkGatewayConnection

