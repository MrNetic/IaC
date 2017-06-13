#Run the following on each sql server
Add-Computer -DomainName Azuring.local -Credential pcondeca
Restart-Computer -force

#install failover clustering and File share role
Install-WindowsFeature –Name Failover-Clustering –IncludeManagementTools

#Create Cluster
New-Cluster -Name WWSQLCluster01 -Node SQL01,SQL02 -StaticAddress 192.168.112.14 -NoStorage

#Cloud witness goes here