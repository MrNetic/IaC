#Login
$StartDate=get-date
write-host    'Executing Authentication Module>>' $MyInvocation.MyCommand.Name '<< at UTC' $StartDate.ToUniversalTime() 'with the configuration bellow:' `
-foregroundcolor "DarkBlue" -backgroundcolor "gray"
try 
{
    Login-AzureRmAccount
}
catch 
{
    Write-Output "There was an exception!"
    $_.Exception.Message
}


