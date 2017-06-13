#Run the following on each sql server at the West Central US
Add-Computer -DomainName Azuring.local -Credential pcondeca
Restart-Computer -force

#install failover clustering and File share role
Install-WindowsFeature –Name Failover-Clustering,File-Services –IncludeManagementTools

Get-Cluster WestEuropeSQLCluster01 | Add-ClusterNode SQL03

Get-Cluster WestEuropeSQLCluster01 | Add-ClusterNode SQL04
#Enable S2D on the cluster
Enable-ClusterS2D

#View Disks
Get-StorageSubsystem Clus* | Get-PhysicalDisk

#Create Storage Pool
New-Volume -StoragePoolFriendlyName S2D* -FriendlyName DATA01 -FileSystem CSVFS_NTFS -AllocationUnitSize 65536 -Size 80GB -ProvisioningType Fixed -ResiliencySettingName Mirror
New-Volume -StoragePoolFriendlyName S2D* -FriendlyName LOG01 -FileSystem CSVFS_NTFS -AllocationUnitSize 65536 -Size 40GB -ProvisioningType Fixed -ResiliencySettingName Mirror
New-Volume -StoragePoolFriendlyName S2D* -FriendlyName TEMPDB01 -FileSystem CSVFS_NTFS -AllocationUnitSize 65536 -Size 40GB -ProvisioningType Fixed -ResiliencySettingName Mirror
New-Volume -StoragePoolFriendlyName S2D* -FriendlyName BACKUP01 -FileSystem CSVFS_NTFS -AllocationUnitSize 65536 -Size 40GB -ProvisioningType Fixed -ResiliencySettingName Mirror

#At just need to run the cluster validation, and go!
