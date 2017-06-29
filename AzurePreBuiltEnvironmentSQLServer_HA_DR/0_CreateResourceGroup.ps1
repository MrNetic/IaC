# Login to access the subscription:
Login-AzureRmAccount

#Pay attention if your account has access to multiple subscriptions, make sure you are on the correct one :)
Get-AzureRmSubscription 

#Select correct subscription
Select-AzureRmSubscription -SubscriptionId e7c49cc2-f1dd-458b-b592-a9f941b5c9a5

#Creating 2 Resouce Group in different Regions, One in WestEurope and the other In WestCentralUs
#https://docs.microsoft.com/en-us/azure/virtual-machines/windows/infrastructure-resource-groups-guidelines
<#
Implementation guidelines for Resource Groups
Decisions:
•Are you going to build out Resource Groups by the core infrastructure components, or by complete application deployment?
•Do you need to restrict access to Resource Groups using Role-Based Access Controls?
+  
Tasks:
•Define what core infrastructure components and dedicated Resource Groups you need.
•Review how to implement Resource Manager templates for consistent, reproducible deployments.
•Define what user access roles you need for controlling access to Resource Groups.
•Create the set of Resource Groups using your naming convention. You can use Azure PowerShell or the portal.
#>

New-AzureRmResourceGroup -Name rgInfrastructure01 -Location "WestEurope"

New-AzureRmResourceGroup -Name rgInfrastructure02 -Location "WestCentralUs"

#MISC
#Add-AzureAccount
#Get-AzureRmVM -ResourceGroupName "PauloCondecaInfraRG01" 

