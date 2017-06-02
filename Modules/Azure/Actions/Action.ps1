#Functions Zone
function Show-Menu
{
    param (
        [string]$Title = 'Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host '1: Press 1 to manage your azure account'
    Write-Host '2: Press 2 to manage VMs'
    Write-Host '3: Press 3 to manage storage'
    Write-Host '4: Press 4 to manage networks'
    Write-Host 'R: Press R to return to options'

}

 Show-Menu "IaC - Infrasctructure as Code | Actions"
    $OptionEnvironment = Read-Host 'Please make a selection'
    switch ($OptionEnvironment)
    {
        '1' {
            'You chose to manage azure account'

        } '2' {
            'You chose to manage VMs'
        } '3' {
            'You chose to manage storage'
        }'4' {
            'You chose to manage networks'
        } 'R' {
             ' You choose to Return...'
        }

    }

Agora aqui vais chamar o script que gere as subscrições