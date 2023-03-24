
$Folder="C:\Temp"

$ACLList = Get-ACL -Path $Folder 


$ACLList.Access | Select FileSystemRights, AccessControlType, IdentityReference, IsInherited

# ACLs are a mask - full details here as sometimes you'll get an integer rather than human readable format
# https://learn.microsoft.com/en-us/dotnet/api/system.security.accesscontrol.filesystemrights?redirectedfrom=MSDN&view=net-7.0