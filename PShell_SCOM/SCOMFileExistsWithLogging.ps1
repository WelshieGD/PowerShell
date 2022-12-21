<#
YOU NEED A SCOM AGENT INSTALLED ON THE SERVER WHERE YOU ARE TESTING THE SCRIPT
#>


#function to create the events with parameters
function CreateParamEvent ($evtID, $param1, $param2, $param3)
  {
    $id = New-Object System.Diagnostics.EventInstance($evtID,1); #INFORMATION EVENT
    #$id = New-Object System.Diagnostics.EventInstance($evtID,1,2); #WARNING EVENT
    #$id = New-Object System.Diagnostics.EventInstance($evtID,1,1); #ERROR EVENT
    $evtObject = New-Object System.Diagnostics.EventLog;
    $evtObject.Log = $evtlog;
    $evtObject.Source = $source;
    $evtObject.WriteEvent($id, @($param1,$param2,$param3))
  }


# Set Path
$Path = 'C:\Temp\verbs.txt'


#Define the event log and your custom event source
$evtlog = "Application"
$source = "MyEventSource"

#These are just examples to pass as parameters to the event
$hostname = $env:computername
$timestamp = (get-date)



# Check if Log exists
# Ref: http://msdn.microsoft.com/en-us/library/system.diagnostics.eventlog.exists(v=vs.110).aspx
# [System.Diagnostics.EventLog]::Exists($evtlog);

#Load the event source to the log if not already loaded.  This will fail if the event source is already assigned to a different log. This requires admin rights on box (if SCOM agent runninng as local system then OK)
if ([System.Diagnostics.EventLog]::SourceExists($source) -eq $false) {
        [System.Diagnostics.EventLog]::CreateEventSource($source, $evtlog)
        CreateParamEvent 1234 "Log Source $source Created at $timestamp" $hostname $timestamp 
}

$ScomAPI = New-Object -comObject "MOM.ScriptAPI"
$PropertyBag = $ScomAPI.CreatePropertyBag()
$FileExists = Get-Item -Path $Path
If ($FileExists)
{
CreateParamEvent 1234 "$Path existed at $timestamp" $hostname $timestamp 
$Message = "$Path Exists"
}
Else
{
CreateParamEvent 1234 "$Path didn't exist at $timestamp" $hostname $timestamp 
$Message = "$Path Doesn't Exist"
}

$PropertyBag.AddValue("MessageText",$Message)

$SCOMapi.Return($Propertybag)
