#For SQL03
$machineName="SQL03"
$rgName = 'rgInfrastructure02'
$asName='asSQLServer02'
$location = 'WestCentralUs' 

$vnetName= "VnetProductionWestCentralUs"
$subnetName="subnetSQLBackendWestCentralUs"
$ipAddress ="10.10.113.11"

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


Get-AzureRmNetworkInterface | Where-Object{$_ -like "*end*"}

$VirtualMachine = Get-AzureRmVM -ResourceGroupName $rgName -Name $machineName
Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id "/subscriptions/e7c49cc2-f1dd-458b-b592-a9f941b5c9a5/resourceGroups/rgInfrastructure02/providers/Microsoft.Network/networkInterfaces/NicsubnetSQLBackendWestCentralUsSQL03"
Update-AzureRmVM -ResourceGroupName $rgName -VM $VirtualMachine 


### SQL04
$machineName="SQL04"
$rgName = 'rgInfrastructure02'
$asName='asSQLServer02'
$location = 'WestCentralUs' 

$vnetName= "VnetProductionWestCentralUs"
$subnetName="subnetSQLBackendWestCentralUs"
$ipAddress ="10.10.113.12"
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
Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id "/subscriptions/e7c49cc2-f1dd-458b-b592-a9f941b5c9a5/resourceGroups/rgInfrastructure02/providers/Microsoft.Network/networkInterfaces/NicsubnetSQLBackendWestCentralUsSQL04"
Update-AzureRmVM -ResourceGroupName $rgName -VM $VirtualMachine 

