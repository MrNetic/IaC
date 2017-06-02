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

 Show-Menu "IaC - Infrasctructure as Code"
    $OptionEnvironment = Read-Host 'Please make a selection'
    switch ($OptionEnvironment)
    {
        '1' {
            'You chose Azure'
            Exit 1
        } '2' {
            'You chose Aws - Under Development'
        } '3' {
            'You chose GCompute - Under Development'
        }'4' {
            'You chose OnPremises - Under Development'
        }'5' {
            'You chose Hibrid - Under Development'
            
        } 'q' {
             ' You choose to quit...'
            #Quit Option
            Exit 10
        }
        default {
            #No Option
            'Not a valid option'
            Exit 11
        }
    }
