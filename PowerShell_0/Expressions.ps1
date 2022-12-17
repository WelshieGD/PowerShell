
# "Change" Property names e.g. when output doesn't map to expected input name
# This is useful when the output of your command is an input to another command and the output parameter name isn't the same as the required input property name. 

# region get-process
Get-Process | Select-Object -Property @(
    'Name'
    @{Name = 'ProcessId'; Expression = 'ID' }
    @{Name = 'FileOwner'; Expression = { (Get-Acl $_.Path).Owner }}
)

#endregion get-process

#region customobject

$CustomObject = [pscustomobject]@{ Service = 'w32time' }

$CustomObject|
  Select-Object -Property@{name='Name';expression={$_.Service}} |
    Stop-Service

#endregion customobject

