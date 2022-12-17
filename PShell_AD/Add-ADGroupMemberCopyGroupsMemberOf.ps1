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