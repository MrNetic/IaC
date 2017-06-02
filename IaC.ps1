#Infrasctrure as code 

#Script Path
$ScriptPath = Split-Path $MyInvocation.InvocationName
# DebugFlag for a more verbose output
[bool] $debugFlag=1

# Variables
[string] $OptionEnvironment=1


#Functions Zone
function Show-Menu
{
    param (
        [string]$Title = 'Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host '1: Press 1 for Azure'
    Write-Host '2: Press 2 for Aws'
    Write-Host '3: Press 3 for Gcompute'
    Write-Host '4: Press 4 for OnPremises'
    Write-Host '5: Press 5 for Hibrid'
    Write-Host 'Q: Press Q to quit'
}


#Question number 1, where are you touching?

do 
{
    Show-Menu "IaC - Infrasctructure as Code"
    $OptionEnvironment = Read-Host 'Please make a selection'
    switch ($OptionEnvironment)
    {
        '1' {
            'You chose Azure'
        } '2' {
            'You chose Aws - Under Development'
        } '3' {
            'You chose GCompute - Under Development'
        }'4' {
            'You chose OnPremises - Under Development'
        }'5' {
            'You chose Hibrid - Under Development'
        } 'q' {
            return
        }
    }

    #If Azure is chosen
    If (($OptionEnvironment -eq 1))
    { 
        try 
        {
            #Authenticate to Azure
            $cmd = "$ScriptPath\Modules\Azure\Authentication\Login.ps1"
            Invoke-Expression "$cmd"    

        }
        catch 
        {   

                    Write-Output "There was an exception!"
                    $_.Exception.Message
            
        } 

        
    }

} #Until it Quits
until ($input -eq 'q')

