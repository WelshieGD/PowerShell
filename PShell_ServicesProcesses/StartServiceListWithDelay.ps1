Function Test-Service {
    [CmdletBinding()]
    [OutputType([string])]

    param(
         [Parameter(Mandatory=$true)]
         [string]$ServiceName
        )

        # Service StartType - https://learn.microsoft.com/en-us/dotnet/api/system.serviceprocess.servicestartmode?view=dotnet-plat-ext-7.0
        # Service Status - https://learn.microsoft.com/en-us/dotnet/api/system.serviceprocess.servicecontrollerstatus?view=dotnet-plat-ext-7.0
        

        $ServiceStatus = Get-Service -Name $ServiceName -ErrorAction 'SilentlyContinue'

        # An alternative is to pass back a flag rather than a $LogMessage and set the error message and potentially different event ids when the flag is returned to the calling code. 
        If ($ServiceStatus)
            {
                If ($ServiceStatus.StartType -eq "Disabled")        {
                    $LogMessage = "$ServiceName exists but Service is disabled."
                    }
                else {
                    $LogMessage = "$ServiceName exists and service is not disabled"
                }
            }
        else 
        {
        $LogMessage = "$ServiceName does not exist"
        } 
    
      $LogMessage
}


Function Start-ServiceWithDelay {
    [CmdletBinding()]
    [OutputType([string])]

    param(
         [Parameter(Mandatory=$true)]
         [string]$ServiceName,

         [Parameter(Mandatory=$true)]
        [int]$Delay
        )

        Start-Service -Name $ServiceName -PassThru 
        Start-Sleep $Delay

        # Probably put a check in here Get-Service and check status to make sure it is running before proceeding. 
        # You could potentially also have it check 3 times and if the service isn't running either proceed to the next service or stop all processing.
}

# simulate Get-content your input file (no change)
# Service is the service to start
# Delay is the delay before trying to start the next service. Delay on last service is always set to zero. 
$ServicesActions = @"
WindowsService1, 10
WindowsService22, 20
WindowsService3, 30
WindowsService4, 0
"@ |ConvertFrom-Csv -Delimiter "," -Header Service, Delay

# Create an Event Log Source
If ([System.Diagnostics.EventLog]::SourceExists("ServiceStartScript") -eq $false)
{
    New-EventLog -LogName 'Application' -Source 'ServiceStartScript'
}


foreach ($srv in $ServicesActions)
    {
        <# Check if service exists
        https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands?view=powershell-7.3#diagnostic-verbs
        Simple check to test if the service exists, then checks to make sure it isn't disabled.
        1. If service doesn't exist or is disabled then an error message is written to the log and the code continues to the other services. This could be adapted to either stop further processing or even to roll back and stop services already started
        2. If the service is running then go onto the function so that we can be sure the delay is applied. This could be adapted to pull the start time of the service to see if it was greater than the delay.
        #> 
        $TestService = Test-Service $srv.Service

        # You could look to evaluate the message (or return a flag here) and have a different messages \ event ids for each possible outcome e.g. service doesn't exist, service does exist but is disabled, service exists 
        Write-EventLog -LogName 'Application' -Source 'ServiceStartScript' -EntryType 'Information' -EventID 10 -Message "$TestService"
     

        # Start Service
        Start-ServiceWithDelay $srv.Service $srv.Delay
        

     
    
}