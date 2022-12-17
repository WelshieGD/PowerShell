#~ Retrieve execution policy for current context
Get-ExecutionPolicy

<#
The execution policy has four main configurations:

Restricted This configuration, which is the default, doesn’t allow you to run scripts.

AllSigned This configuration allows you to run only scripts that have been cryptographically signed by a trusted party (more on this later).

RemoteSigned This configuration allows you to run any script you write, and any script you download as long as it’s been cryptographically signed by a trusted party.

Unrestricted This configuration allows you to run any scripts.

In depth discussion - https://www.darkoperator.com/blog/2013/3/5/powershell-basics-execution-policy-part-1.html 
#>

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

