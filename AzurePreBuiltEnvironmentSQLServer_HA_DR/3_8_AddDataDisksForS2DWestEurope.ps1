#data1
$machineName="Storage01"
$rgName = 'rgInfrastructure01'
$diskName="Data01"
$location = 'WestEurope' 

$dataDisk= New-AzureRmDisk -DiskName $diskName -Disk (New-AzureRmDiskConfig -AccountType StandardLRS -Location $location -CreateOption Empty -DiskSizeGB 64) -ResourceGroupName $rgName

$vm = Get-AzureRmVM -Name $machineName -ResourceGroupName $rgName 

$vm = Add-AzureRmVMDataDisk -VM $vm -Name $diskName -CreateOption Attach -ManagedDiskId $dataDisk.Id -Lun 1

Update-AzureRmVM -VM $vm -ResourceGroupName $rgName

#data2
$machineName="Storage01"
$rgName = 'rgInfrastructure01'
$diskName="Data02"
$location = 'WestEurope' 
$dataDisk= New-AzureRmDisk -DiskName $diskName -Disk (New-AzureRmDiskConfig -AccountType StandardLRS -Location $location -CreateOption Empty -DiskSizeGB 64) -ResourceGroupName $rgName

$vm = Get-AzureRmVM -Name $machineName -ResourceGroupName $rgName 

$vm = Add-AzureRmVMDataDisk -VM $vm -Name $diskName -CreateOption Attach -ManagedDiskId $dataDisk.Id -Lun 2

Update-AzureRmVM -VM $vm -ResourceGroupName $rgName

#Storage02 now

#data3
$machineName="Storage02"
$rgName = 'rgInfrastructure01'
$diskName="Data03"
$location = 'WestEurope' 
$dataDisk= New-AzureRmDisk -DiskName $diskName -Disk (New-AzureRmDiskConfig -AccountType StandardLRS -Location $location -CreateOption Empty -DiskSizeGB 64) -ResourceGroupName $rgName

$vm = Get-AzureRmVM -Name $machineName -ResourceGroupName $rgName 

$vm = Add-AzureRmVMDataDisk -VM $vm -Name $diskName -CreateOption Attach -ManagedDiskId $dataDisk.Id -Lun 1

Update-AzureRmVM -VM $vm -ResourceGroupName $rgName

#data04
$machineName="Storage02"
$rgName = 'rgInfrastructure01'
$diskName="Data04"
$location = 'WestEurope' 
$dataDisk= New-AzureRmDisk -DiskName $diskName -Disk (New-AzureRmDiskConfig -AccountType StandardLRS -Location $location -CreateOption Empty -DiskSizeGB 64) -ResourceGroupName $rgName

$vm = Get-AzureRmVM -Name $machineName -ResourceGroupName $rgName 

$vm = Add-AzureRmVMDataDisk -VM $vm -Name $diskName -CreateOption Attach -ManagedDiskId $dataDisk.Id -Lun 2

Update-AzureRmVM -VM $vm -ResourceGroupName $rgName