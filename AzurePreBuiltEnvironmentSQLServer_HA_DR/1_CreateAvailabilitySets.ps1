#Starting in Ireland, lets create our Availability sets.
# In a nutshell: to avoid having a single point of failure on network/rack/software updates
# FaulDomain number != from datacenter 2 datancer
#latest version
Install-Module AzureRM.Compute -RequiredVersion 2.6.0

#DCs
#WestEurope
New-AzureRmAvailabilitySet -ResourceGroupName rgInfrastructure01 -Name asDomainControllers01 -Location "westeurope" -managed -PlatformFaultDomainCount 3 
#WestCentralUs
New-AzureRmAvailabilitySet -ResourceGroupName rgInfrastructure02 -Name asDomainControllers02 -Location "WestCentralUs" -managed -PlatformFaultDomainCount 2

#SQL
#WestEurope
New-AzureRmAvailabilitySet -ResourceGroupName rgInfrastructure01 -Name asSQLServer01 -Location "westeurope" -managed -PlatformFaultDomainCount 3
#WestCentralUs
New-AzureRmAvailabilitySet -ResourceGroupName rgInfrastructure02 -Name asSQLServer02 -Location "WestCentralUs" -managed -PlatformFaultDomainCount 2

#S2D + SOFS
#WestEurope
New-AzureRmAvailabilitySet -ResourceGroupName rgInfrastructure01 -Name asStorage01 -Location "westeurope" -managed -PlatformFaultDomainCount 3 
#WestCentralUs
New-AzureRmAvailabilitySet -ResourceGroupName rgInfrastructure02 -Name asStorage02 -Location "WestCentralUs" -managed -PlatformFaultDomainCount 2

