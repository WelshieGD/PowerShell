Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} -Properties DisplayName, msDS-UserPasswordExpiryTimeComputed, EmailAddress | `

Select-Object -Property Displayname, EmailAddress, @{Name="Expiration Date";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}} | `

Sort-Object "Expiration Date" | Export-Csv -Path C:\adusers-password-expiration-date.csv -NoTypeInformation