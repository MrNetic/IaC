#View Resouces
Get-ClusterResource
$ClusterNetworkName = "Cluster Network 3" # the cluster network name (Use Get-ClusterNetwork on Windows Server 2012 of higher to find the name).
$IPResourceName = "SQL IP Address 3 (WCUSQL01)" # the IP Address cluster resource name.
$ILBIP = "10.10.112.19" # the IP Address of the Internal Load Balancer (ILB). This is the static IP address for the load balancer you configured in the Azure portal.
[int]$ProbePort = 4444
Import-Module FailoverClusters

Get-ClusterResource $IPResourceName | Set-ClusterParameter -Multiple @{"Address"="$ILBIP";"ProbePort"=$ProbePort;"SubnetMask"="255.255.255.255";"Network"="$ClusterNetworkName";"EnableDhcp"=0}