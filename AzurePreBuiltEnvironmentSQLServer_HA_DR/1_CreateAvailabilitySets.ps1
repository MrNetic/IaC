#Starting in Ireland, lets create our Availability sets.
# In a nutshell: to avoid having a single point of failure on network/rack/software updates

#Ireland DCs
New-AzureRmAvailabilitySet -ResourceGroupName rgInfrastructure01 -Name asDomainControllers01 -Location "northeurope"

#Amsterdam DCs
New-AzureRmAvailabilitySet -ResourceGroupName rgInfrastructure02 -Name asDomainControllers02 -Location "westeurope"

#Ireland SQLServer
New-AzureRmAvailabilitySet -ResourceGroupName rgInfrastructure01 -Name asSQLServer01 -Location "northeurope"

#Amsterdam SQLServer
New-AzureRmAvailabilitySet -ResourceGroupName rgInfrastructure02 -Name asSQLServer02 -Location "westeurope"

Get-AzureRmAvailabilitySet rgInfrastructure01