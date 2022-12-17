
# The closing of the here string "@ must be the first characters on a line

$Message = @"
Could not resolve entity: test5@test.com*. Connection Errors: ServiceResponseException: 
[domain\account<>mail.test6**.com**] => When accessing a mailbox, the primary SMTP address must be used. 
(Primary SMTP: test7@test2.com) ServiceResponseException: [copy_test@test.onmicrosoft.com<>outlook.office365.com] => 
When accessing a mailbox, the primary SMTP address must be used. (Primary SMTP:* test8@test.com*)*
"@

$lines  = $Message.Split(@(' '), [StringSplitOptions]::None)

$Emails =  $lines -match '\b[A-Z0-9+_.-]+@[A-Z0-9.-]+\b'
    
[pscustomobject] $objEmails =  [pscustomobject]@{ 
    First = $Emails.TrimEnd(".","*",")") | select -First 1
    Last = $Emails.TrimEnd(".","*",")") | select -Last 1
    }

 $objEmails