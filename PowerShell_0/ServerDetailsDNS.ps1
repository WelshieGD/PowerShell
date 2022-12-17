
# Returns FQDN - local (can use invoke-command to run on remote)
$ServerName = [System.Net.DNS]::GetHostByName('').HostName
$ServerName # string

# Returns FQDN and IP Address
$ServerDetails = [System.Net.DNS]::GetHostByName($null)
$ServerDetails

# TypeName System.Net.IPHostEntry
$ServerDetails | Get-Member