#Create VMs

#Administrative Account to be locally created on the servers:
$cred    = Get-Credential 

$rgName = 'rgInfrastructure01'
$location = 'WestEurope' 
$asName='asSQLServer01'
$vmSize ="Standard_A0"
$machineName="SQL02"
$vnetName= "VnetProductionWestEurope"
$subnetName="subnetSQLWestEurope"
$ipAddress ="192.168.112.11"


$AvailabilitySet = Get-AzureRmAvailabilitySet -ResourceGroupName $rgName
$AvailabilitySet = $AvailabilitySet.Id | Where-Object {$_ -like "*$asName*"}

$vnet   = Get-AzureRmVirtualNetwork -ResourceGroupName $rgName -Name $vnetName
$subnet = $vnet.Subnets.Id | Where-Object{$_ -like "*$subnetName*"}

$nicName = "Nic"+$subnetName+$MachineName
$nic = New-AzureRmNetworkInterface -Name $nicName -ResourceGroupName $rgName `
-Location $location -SubnetId $subnet `
-PrivateIpAddress $ipAddress 

 #CreateVM Windows 
 $vm = New-AzureRmVMConfig -VMName $machineName -VMSize $vmSize -AvailabilitySetId $AvailabilitySet
 $vm = Set-AzureRmVMOperatingSystem -VM $vm -Windows -ComputerName $machineName `
 -Credential $cred -ProvisionVMAgent -EnableAutoUpdate
 $vm = Set-AzureRmVMSourceImage -VM $vm -PublisherName MicrosoftWindowsServer `
 -Offer WindowsServer -Skus 2016-Datacenter -Version "latest"
 $vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $nic.Id

 New-AzureRmVM -ResourceGroupName $rgName -Location $location -VM $vm 
