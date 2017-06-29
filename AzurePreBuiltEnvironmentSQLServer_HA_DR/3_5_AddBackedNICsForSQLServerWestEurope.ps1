# TBC:
# The objective here is to add 2 more NICS to the SQL Server instance
# that are to be on the same subnet of where the 2 extra NICs of the storage servers are.
# this is to add performance and availability leveraging SMB Multichannel for SOFS

$machineName="SQL01"
$rgName = 'rgInfrastructure01'
$asName='asSQLServer01'
$location = 'WestEurope' 

$vnetName= "VnetProductionWestEurope"
$subnetName="subnetSQLBackedWestEurope"
$ipAddress ="192.168.113.11"

#VM WILL BE STOPPED
Stop-AzureRmVM -Name $machineName -ResourceGroupName $rgName

$vm = Get-AzureRmVm -Name $machineName -ResourceGroupName $rgName 

# Find out all the NICs on the VM and find which one is primary
$vm.NetworkProfile.NetworkInterfaces

# Set NIC 0 to be primary
$vm.NetworkProfile.NetworkInterfaces[0].Primary = $true

# Update the VM state in Azure
Update-AzureRmVM -VM $vm -ResourceGroupName $rgName 


$AvailabilitySet = Get-AzureRmAvailabilitySet -ResourceGroupName $rgName
$AvailabilitySet = $AvailabilitySet.Id | Where-Object {$_ -like "*$asName*"}

$vnet   = Get-AzureRmVirtualNetwork -ResourceGroupName $rgName -Name $vnetName
$subnet = $vnet.Subnets.Id | Where-Object{$_ -like "*$subnetName*"}

$nicName = "Nic"+$subnetName+$MachineName
New-AzureRmNetworkInterface -Name $nicName -ResourceGroupName $rgName `
-Location $location -SubnetId $subnet `
-PrivateIpAddress $ipAddress 


Get-AzureRmNetworkInterface | Where-Object{$_ -like "acked"}

$VirtualMachine = Get-AzureRmVM -ResourceGroupName $rgName -Name $machineName
Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id "/subscriptions/e7c49cc2-f1dd-458b-b592-a9f941b5c9a5/resourceGroups/rgInfrastructure01/providers/Microsoft.Network/networkInterfaces/NicsubnetSQLBackedWestEuropeSQL01"
Update-AzureRmVM -ResourceGroupName $rgName -VM $VirtualMachine 


### SQL02
$machineName="SQL02"
$rgName = 'rgInfrastructure01'
$asName='asSQLServer01'
$location = 'WestEurope' 

$vnetName= "VnetProductionWestEurope"
$subnetName="subnetSQLBackedWestEurope"
$ipAddress ="192.168.113.12"

#VM WILL BE STOPPED
Stop-AzureRmVM -Name $machineName -ResourceGroupName $rgName

$vm = Get-AzureRmVm -Name $machineName -ResourceGroupName $rgName 

# Find out all the NICs on the VM and find which one is primary
$vm.NetworkProfile.NetworkInterfaces

# Set NIC 0 to be primary
$vm.NetworkProfile.NetworkInterfaces[0].Primary = $true

# Update the VM state in Azure
Update-AzureRmVM -VM $vm -ResourceGroupName $rgName 


$AvailabilitySet = Get-AzureRmAvailabilitySet -ResourceGroupName $rgName
$AvailabilitySet = $AvailabilitySet.Id | Where-Object {$_ -like "*$asName*"}

$vnet   = Get-AzureRmVirtualNetwork -ResourceGroupName $rgName -Name $vnetName
$subnet = $vnet.Subnets.Id | Where-Object{$_ -like "*$subnetName*"}

$nicName = "Nic"+$subnetName+$MachineName
New-AzureRmNetworkInterface -Name $nicName -ResourceGroupName $rgName `
-Location $location -SubnetId $subnet `
-PrivateIpAddress $ipAddress 


Get-AzureRmNetworkInterface | Where-Object{$_ -like "acked"}

$VirtualMachine = Get-AzureRmVM -ResourceGroupName $rgName -Name $machineName
Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id "/subscriptions/e7c49cc2-f1dd-458b-b592-a9f941b5c9a5/resourceGroups/rgInfrastructure01/providers/Microsoft.Network/networkInterfaces/NicsubnetSQLBackedWestEuropeSQL02"
Update-AzureRmVM -ResourceGroupName $rgName -VM $VirtualMachine 

