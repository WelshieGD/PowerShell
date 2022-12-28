<#
Hash tables are key \ value pairs 
Arrays store collections of items which are indexed $x=@(blue,green,yellow,red) # zero based x[0]=blue


Get-SCOMAlertResolutionState | Select Name, ResolutionState

Name                    ResolutionState
----                    ---------------
New                                   0
Awaiting Evidence                   247
Assigned To Engineering             248
Acknowledged                        249
Scheduled                           250
Resolved                            254
Closed                              255

#>

Import-Module OperationsManager
new-scommanagementgroupconnection -ComputerName SCOMMS.Langkah.net


# List Alert ResolutionStates
$AlertResolutionStates | Select-Object Name, ResolutionState

# Create Hash Table
$AlertResolutionStates = Get-SCOMAlertResolutionState | group -AsHashTable -AsString ResolutionState

$AlertResolutionStates

<#
Name                           Value
----                           -----
255                            {Closed}
254                            {Resolved}
248                            {Assigned To Engineering}
250                            {Scheduled}
249                            {Acknowledged}
247                            {Awaiting Evidence}
0                              {New}
#>

$AlertResolutionStates["247"]

<#
ManagementGroup   : SCOMProd
Name              : Awaiting Evidence
ShortcutKey       :
ResolutionState   : 247
IsSystem          : True
Id                : cae71956-1591-4fe8-8fe6-1b2a003cc500
ManagementGroupId : 913a9936-a68b-54b4-0015-e849c0ae404b
#>


$AlertResolutionStates["247"]  | Select-Object Name
