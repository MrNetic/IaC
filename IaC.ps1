#Infrasctrure as code 

#Script Path
$ScriptPath = Split-Path $MyInvocation.InvocationName

#Handle flow flag
[bool] $controlFlag =1

# DebugFlag for a more verbose output
[bool] $debugFlag=1

# Variables
[string] $OptionEnvironment=9999

#ExitCode




#Question number 1, where are you touching?
do 
{
    #Calling mainm menu
    $cmd = "$ScriptPath\Modules\Menu\Main.ps1"
    Invoke-Expression "$cmd"    
    $OptionEnvironment=$LASTEXITCODE

    #If Azure is chosen
    If (($OptionEnvironment -eq 1))
    { 
        try 
        {
            #Authenticate to Azure
            $cmd = "$ScriptPath\Modules\Azure\Authentication\Login.ps1"
            Invoke-Expression "$cmd"    
            $OptionEnvironment=$LASTEXITCODE

        }
        catch 
        {   

                    Write-Output "There was an exception!"
                    $_.Exception.Message
            
        } 

         try 
        {
            #Authenticate to Azure
            $cmd = "$ScriptPath\Modules\Azure\Actions\Action.ps1"
            Invoke-Expression "$cmd"    
            $OptionEnvironment=$LASTEXITCODE

        }
        catch 
        {   

                    Write-Output "There was an exception!"
                    $_.Exception.Message
            
        } 

        
    }# End of Azure Options

    #View Environment
    if ($debugFlag -eq 'true')
    {
    "OptionEnvironment value:"
    $OptionEnvironment 
}

} #Until it Quits

until ($OptionEnvironment -eq '10')

