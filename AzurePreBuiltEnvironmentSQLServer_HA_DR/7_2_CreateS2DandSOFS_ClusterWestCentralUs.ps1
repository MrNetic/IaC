#Run the following on each sql server
Add-Computer -DomainName Azuring.local -Credential pcondeca
Restart-Computer -force

#install failover clustering and File share role
Install-WindowsFeature –Name Failover-Clustering,File-Services,FS-FileServer –IncludeManagementTools


#Create Cluster
New-Cluster -Name WestCentralUsStorage01 -Node Storage03,Storage04 -StaticAddress 10.10.115.24 -NoStorage

#PowerShell Script to create a cloud witness
yada yada

#Enable S2D on the cluster
Enable-ClusterS2D

#View Disks
Get-StorageSubsystem Clus* | Get-PhysicalDisk

#Create Virtual Disks
New-Volume -StoragePoolFriendlyName S2D* -FriendlyName VDiskData01 -FileSystem CSVFS_NTFS -AllocationUnitSize 65536 -Size 50GB -ProvisioningType Fixed -ResiliencySettingName Mirror
New-Volume -StoragePoolFriendlyName S2D* -FriendlyName VDiskLog01 -FileSystem CSVFS_NTFS -AllocationUnitSize 65536 -Size 25GB -ProvisioningType Fixed -ResiliencySettingName Mirror

#Tempdb Decision to SOFS or not to SOFS :)

#Check cluster shared volumes
Get-ClusterSharedVolume

#Create scale-out file server (SOFS)
Add-ClusterScaleOutFileServerRole -Name westcentralus-sofs01 -Cluster WestCentralUsStorage01

#Create SMB File Shares
New-Item -Path C:\ClusterStorage\WestCentralUsData01\Data -ItemType Directory
New-SmbShare -Name DATA01 -Path C:\ClusterStorage\WestCentralUsData01\Data 

New-Item -Path C:\ClusterStorage\WestCentralUsLog01\Data -ItemType Directory
New-SmbShare -Name LOG01 -Path C:\ClusterStorage\WestCentralUsLog01\Data


#View storage pool
Get-StoragePool S2D*
Get-StoragePool S2D* | Get-PhysicalDisk
#At just need to run the cluster validation, and go!
