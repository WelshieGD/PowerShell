
# Run with administrator credentials

# Get Logged in User
$LoggedInUser = (Get-WMIObject -class Win32_ComputerSystem | select user).username


# Add to local Remote Desktop Users Group
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $LoggedInUser


<# Finding logged in user 

If you want to access the environment variable:
(easier/shorter/memorable option)
	• [Environment]::UserName 
	• $env:username
    • whoami

Shows context of user running PowerShell
 [System.Security.Principal.WindowsIdentity]::GetCurrent().Name


#>