
<#
Key Notes:
- You can't use -Identity and -Filter together.
#>
$group = "SCOMAdmin"
Get-ADGroupMember -Identity $group | ForEach-Object {
    Get-ADUser -Identity $_.SamAccountName -Properties EmailAddress, LastLogonDate, whenCreated
    Select-Object -Property Name, GivenName, Surname, UserPrincipalName, EmailAddress, Enabled, LastLogonDate, whenCreated | Select Name, SamAccountName, LastLogonDate,  whenCreated | Export-Csv -Append -Path "C:\temp\export.csv" -NoTypeInformation
}

Get-ADUser -Identity $member.SamAccountName -Filter {(enabled -eq $true) -and (whenCreated -lt $date) -and (LastLogonDate -gt $date)} -Properties LastLogonDate, whenCreated | Select Name, SamAccountName, LastLogonDate, whenCreated | Export-Csv -Append -Path "C:\temp\export.csv" –notypeinformation


# Members of a group that haven't logged on in the last 24 hours
# Need to use -Identity to pull back the specific user being iterated
$timeframe = 24
$date = (Get-Date).Addhours(-($timeframe))
$group = "SCOMAdmin"
$date
Get-ADGroupMember -Identity $group | ForEach-Object {
    Get-ADUser -Identity $_.SamAccountName -Properties EmailAddress, LastLogonDate, whenCreated | Where-Object {$_.LastLogonDate -gt $date} |  
    Select-Object -Property Name, GivenName, Surname, UserPrincipalName, EmailAddress, Enabled, LastLogonDate, whenCreated |
    Select Name, SamAccountName, LastLogonDate,  whenCreated | 
    Export-Csv -Append -Path "C:\temp\export.csv" -NoTypeInformation
}



# https://lazyadmin.nl/powershell/get-adgroupmember/

# https://adamtheautomator.com/get-adgroupmember/