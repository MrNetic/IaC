# Login to access the subscription:
Login-AzureRmAccount

#Pay attention if your account has access to multiple subscriptions, make sure you are on the correct one :)
Get-AzureRmSubscription

#Select correct subscription
Select-AzureRmSubscription -SubscriptionId 

#Creating 2 Resouce Group in different Regions, One in Ireland and the other In Amsterdam

New-AzureRmResourceGroup -Name rgInfrastructure01 -Location "NorthEurope"

New-AzureRmResourceGroup -Name rgInfrastructure02 -Location "WestEurope"


Remove-AzureRmResourceGroup
#MISC
#Add-AzureAccount
#Get-AzureRmVM -ResourceGroupName "PauloCondecaInfraRG01" 

