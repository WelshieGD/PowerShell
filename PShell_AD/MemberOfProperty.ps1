
# This will capture the user information and the groups of which they are a member as an array
Get-ADUser -Identity graham -Properties MemberOf
# Returns DN of graham, SAMAccountName etc + MemberOf : {CN=SCOMAdmin,OU=SCOM,OU=LangkahGroups,DC=langkah,DC=net, CN=SQLAdmins,OU=SQL,OU=LangkahGroups,DC=langkah,DC=net}

# This captures just the group information - MemberOf attribute is not captured by default so needs to be explicity specified.
(Get-ADUser -Identity graham -Properties MemberOf).MemberOf
#CN=SCOMAdmin,OU=SCOM,OU=LangkahGroups,DC=langkah,DC=net
#CN=SQLAdmins,OU=SQL,OU=LangkahGroups,DC=langkah,DC=net

# You need to include -Properties MemberOf so that the objects returned by Get-ADUser has the associated .MemberOf attribute
# The following will not return any groups (compare code \ output with above)
(Get-ADUser -Identity graham).MemberOf
# There is not ouput -Property MemberOf was ommitted so atttribute not available 



# Copy Groups a user is a member of
$Copy_From = "graham"
$Copy_To = "graham2"

# Will prompt for Admin Credentials create user disabled (as no password specified)
$Cred = Get-Credential
If (-not(Get-ADUser -Filter {samAccountName -eq $Copy_To})) {
New-ADUser -Name "graham2" -Path "OU=LangkahUsers,DC=Langkah,DC=net" -Credential $Cred
}
$groups = (Get-ADUser -Identity $Copy_From -Properties MemberOf).MemberOf

foreach ($group in $groups) {
    # Will prompt for password for each group! 
    $groups | Add-ADGroupMember -Members $Copy_To -Credential langkah\administrator
}