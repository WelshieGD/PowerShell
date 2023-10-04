

param (
        [switch]$LogOutputToScreen,
        [switch]$LogOutputToFile
)

#region Logging
Function CreateLogFile {
    [string]$LogFilePath = 'C:\Temp\SCOM\Logs'
    try {
        
        if (!(Test-Path $LogFilePath)) 
        {
            New-Item -Path $LogFilePath -ItemType "directory" | Out-Null
        }
    }
    catch {
        $err = $_.Exception.Message
        Write-Warning "Unable to create log folder $LogFilePath : Exception $err"
        Write-Warning "Script exiting"
        exit 99
    }

    # Create Log File Name
    $global:LogTime = Get-Date -Format 'yyyyMMdd-HHmmss'
    $global:LogFileName = $LogFilePath + '\' + $LogTime + '_' + $ParentScript + '.log'
}

Function LogEvent {
param(
    [Parameter(Mandatory=$true,Position=1)][String]$LogMessage,
    [Parameter(Mandatory=$true,Position=2)][ValidateSet('INFO','WARN','ERROR','DEBUG')][String]$LogLevel   
)
    # Retrieve the current date and time in strict ISO 8601 format: YYYY-MM-DD
    $date = Get-Date -Format s
    $LogMsgLevelPrefix = "${logLevel}::${LogMessage}"
    $LogMsgDatePrefix = "${date}::$LogMsgLevelPrefix"
    
    switch($LogLevel)
    {   
        "INFO" {$ForegroundColor = "White"; $evtLevel = "Information" }
        "WARN" {$ForegroundColor = "Yellow"; $evtLevel = "Warning" }
        "ERROR" {$ForegroundColor = "Red"; $evtLevel = "Error"}
        "DEBUG" {$ForegroundColor = "Gray"; $evtLevel = "Information" }
        default {$ForegroundColor = "White"; $evtLevel = "Information" }
    }

    if(($LogLevel -eq 'DEBUG' -and $logDebug -eq $true) -or $LogLevel -ne 'DEBUG')
    {
        if ($LogOutputToScreen)
        {
            Write-Output $LogMsgLevelPrefix -ForegroundColor $ForegroundColor
        }

        if ($LogOutputToFile)
        {
            $LogMsgDatePrefix | Out-File -FilePath $global:LogFileName -Append
        }
        
    }

    # Rotate Logs - Delete Logs Over 7 days old
    Function Rotate-Logs{
        param(
            [string]$LogFilePath, [int32]$LogDaysCount =7
            )
        $delLogs = Get-ChildItem -Path -Path $LogFilePath -Recurse -File | Where-Object {($_.Name).Trim() -like "$ParentScript*" | Where-Object CreationTime -lt (Get-Date.AddDays(-$LogDaysCount))}   
        $delLogs | Remove-Item -Force
    }

if ($MyInvocation.MyCommand.Name) {
    $ParentScript = $MyInvocation.MyCommand.Name
}
else {
    $ParentScript = 'Unknown Script'
}

}

#endRegion

CreateLogFile

LogEvent  "Hello World" "INFO"

