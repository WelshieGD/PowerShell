# An Exception is like an event that is created when normal error handling can't deal with the issue
# Terminating Error - Code stops - 

# Non-Terminating Error - An error is added to the output stream
# Without throwing an excetpion - not caught by catch statement in try \ cacth \ finally
# Write-Error does this .. no exception .. non-terminating .. 

# Writes error Get-Content: Cannot find path 'C:\Folder Doesnt Exist' because it does not exist.
# But continues with next line Hello World
# If you don't clear the error stream then PShell continues to append

<#
To change defaul behaviour e.g. change non-terminating error into a  terminating error, you’ll use the ErrorAction parameter. 

This is a common parameter, meaning that it’s built into every PowerShell cmdlet. The ErrorAction parameter determines what action to take if the cmdlet in question encounters a nonterminating error. This parameter has five main options:

Continue Outputs the error message and continues to execute the cmdlet. This is the default value.

Ignore Continues to execute the cmdlet without outputting an error or recording it in the $Error variable.

Inquire Outputs the error message and prompts the user for input before continuing.

SilentlyContinue Continues to execute the cmdlet without outputting an error, but records it in the $Error variable.

Stop Outputs the error message and stops the cmdlet from executing.

#>

#region nonterminating

$InformationPreference = 'Continue'
$Error.Clear()
Get-Content -Path "C:\Folder Doesnt Exist"
"Hello World"
$Error | Write-Information



# NonTerminating Error will not be picked up by catch statement
$InformationPreference = 'Continue'
$Error.Clear()
try {
    Get-Content -Path "C:\Folder Doesnt Exist"
}
catch {
    "Hey dude; why are you searching there? " | Write-Error
}

$Error[0]  # last error in error stream

# Use Test-Path to see if folder exists
# This wil throw an error and the ctach statement will trigger before "Panic at the disco"
$InformationPreference = 'Continue'
$Error.Clear()
try {
    if (Test-Path -Path "C:\Folder Doesnt Exist")
    {
    Get-Content -Path "C:\Folder Doesnt Exist"
    }
    else 
    {
        Throw "Folder Not Found"
        "Panic at the disco"
    }
}
catch {
    "Hey dude; why are you searching there? " 
}

$Error[0]  # last error in error stream from the Throw Statement "Folder Not Found"



#endregion


#region terminating

#endregion
