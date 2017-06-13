#First remove auto-pooling

Get-StorageSubSystem Cluster* | Set-StorageHealthSetting -Name "System.Storage.PhysicalDisk.AutoPool.Enabled" -Value False

$machineName="Storage03"
$rgName = 'rgInfrastructure02'
$diskName="Data01"
$location = 'WestCentralUs' 

$dataDisk= New-AzureRmDisk -DiskName $diskName -Disk (New-AzureRmDiskConfig -AccountType StandardLRS -Location $location -CreateOption Empty -DiskSizeGB 64) -ResourceGroupName $rgName

$vm = Get-AzureRmVM -Name $machineName -ResourceGroupName $rgName 

$vm = Add-AzureRmVMDataDisk -VM $vm -Name $diskName -CreateOption Attach -ManagedDiskId $dataDisk.Id -Lun 1

Update-AzureRmVM -VM $vm -ResourceGroupName $rgName

#data2
$machineName="Storage03"
$rgName = 'rgInfrastructure02'
$diskName="Data02"
$location = 'WestCentralUs' 
$dataDisk= New-AzureRmDisk -DiskName $diskName -Disk (New-AzureRmDiskConfig -AccountType StandardLRS -Location $location -CreateOption Empty -DiskSizeGB 64) -ResourceGroupName $rgName

$vm = Get-AzureRmVM -Name $machineName -ResourceGroupName $rgName 

$vm = Add-AzureRmVMDataDisk -VM $vm -Name $diskName -CreateOption Attach -ManagedDiskId $dataDisk.Id -Lun 2

Update-AzureRmVM -VM $vm -ResourceGroupName $rgName

#SQL04 now

$machineName="Storage04"
$rgName = 'rgInfrastructure02'
$diskName="Data03"
$location = 'WestCentralUs' 

$dataDisk= New-AzureRmDisk -DiskName $diskName -Disk (New-AzureRmDiskConfig -AccountType StandardLRS -Location $location -CreateOption Empty -DiskSizeGB 64) -ResourceGroupName $rgName

$vm = Get-AzureRmVM -Name $machineName -ResourceGroupName $rgName 

$vm = Add-AzureRmVMDataDisk -VM $vm -Name $diskName -CreateOption Attach -ManagedDiskId $dataDisk.Id -Lun 1

Update-AzureRmVM -VM $vm -ResourceGroupName $rgName

#data2
$machineName="Storage04"
$rgName = 'rgInfrastructure02'
$diskName="Data04"
$location = 'WestCentralUs' 
$dataDisk= New-AzureRmDisk -DiskName $diskName -Disk (New-AzureRmDiskConfig -AccountType StandardLRS -Location $location -CreateOption Empty -DiskSizeGB 64) -ResourceGroupName $rgName

$vm = Get-AzureRmVM -Name $machineName -ResourceGroupName $rgName 

$vm = Add-AzureRmVMDataDisk -VM $vm -Name $diskName -CreateOption Attach -ManagedDiskId $dataDisk.Id -Lun 2

Update-AzureRmVM -VM $vm -ResourceGroupName $rgName
