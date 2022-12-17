
# Invoke-Command creates a session, runs script block and closes session - slow
# Need to be in Remote Management Users Local Group on computer you want to invoke session on
# Or Remote Management Users AD Group (Built-in)

#region Invoke

# You won't be able to start \ stop services retrieved this way. The list of services is retrieved and session closed

$serviceName = 'wuauserv'
$Service = Invoke-Command -ComputerName WinDev -ScriptBlock {Get-Service -Name $using:serviceName } 
# Needs to run as admin but this will stop local service not remote
$Service | Stop-Service

# Can do in one line but need to do everything remotely in script block


$ServiceStop = Invoke-Command -ComputerName WinDev -ScriptBlock {Stop-Service -Name $using:serviceName } 
$ServiceStart = Invoke-Command -ComputerName WinDev -ScriptBlock {Start-Service -Name $using:serviceName } 

$ServerName = Invoke-Command -ComputerName DC1 -ScriptBlock {
    [System.Net.DNS]::GetHostByName('').HostName
} 
$ServerName

# To use local parameters need -ArgumentList
$FilePath = "C:\MyFile.txt"
Invoke-Command -ComputerName DC1 -ScriptBlock {
    $InformationPreference = 'Continue'
    $ServerName = [System.Net.DNS]::GetHostByName('').HostName
    Write-Information "FilePath is $($args[0]) on server $ServerName" 
} -ArgumentList $FilePath

# OR $using statement
# This exposes all local variables so may have varied results and has problems with pester tests

$FilePath = "C:\MyFile.txt"
Invoke-Command -ComputerName DC1 -ScriptBlock {
    $InformationPreference = 'Continue'
    $ServerName = [System.Net.DNS]::GetHostByName('').HostName
    Write-Information "FilePath is $using::FilePath on server $ServerName" 
}

#endregion


#region PSSession
#If you need to persist a session then use PS Session 
New-PSSession -ComputerName WinDev

# List Sessions
Get-PSSession

# Use Invoke-Command in session - this is much quicker as session already exists

Invoke-Command 
$ServiceStop = Invoke-Command -Session $Session -ScriptBlock {Stop-Service -Name $using:serviceName } 
$ServiceStart = Invoke-Command -Session $Session -ScriptBlock {Start-Service -Name $using:serviceName } 

# Can set variables in session without losing values
Invoke-Command -Session $session -ScriptBlock { $foo = 'Please be here next time' }
Invoke-Command -Session $session -ScriptBlock { $foo }

# Enter PS Session - allows you to work with session interactively
# Prompt will change to show you are running commands remotely
Enter-PSSession -ComputerName WinDev

# Disconnect
Get-PSSession | Disconnect-PSSession

# Reconnect
Connect-PSSession - -ComputerName WinDev

# Remove Sessions
Get-PSSession | Remove-PSSession
Get-PSSession

# If using a variable for session then clear that.
$Session = ''


#endregion
