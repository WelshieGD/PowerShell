
# Run with administrator credentials

# Get Logged in User
$LoggedInUser = Get-WMIObject -class Win32_ComputerSystem | select username


# Add to local Remote Desktop Users Group
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $LoggedInUser


<# Finding user running PowerShell (not neccesarily the same as the logged on user!)

Shows context of user running PowerShell

If you want to access the environment variable:
(easier/shorter/memorable option)
	• [Environment]::UserName 
	• $env:username
    • whoami

OR

 [System.Security.Principal.WindowsIdentity]::GetCurrent().Name


#>