# Login to access the subscription:
Login-AzureRmAccount

#Pay attention if your account has access to multiple subscriptions, make sure you are on the correct one :)
Get-AzureRmSubscription 

#Select correct subscription
Select-AzureRmSubscription -SubscriptionId e7c49cc2-f1dd-458b-b592-a9f941b5c9a5

#Creating 2 Resouce Group in different Regions, One in Ireland and the other In Amsterdam

New-AzureRmResourceGroup -Name rgInfrastructure01 -Location "WestEurope"

New-AzureRmResourceGroup -Name rgInfrastructure02 -Location "WestCentralUs"

#MISC
#Add-AzureAccount
#Get-AzureRmVM -ResourceGroupName "PauloCondecaInfraRG01" 

