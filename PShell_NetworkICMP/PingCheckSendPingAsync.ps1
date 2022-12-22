<# ADD-Member
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/add-member?view=powershell-7.3
Adds custom properties and methods to an instance of a PowerShell object.
#>

<# SendPingAsync
https://learn.microsoft.com/en-us/dotnet/api/system.net.networkinformation.ping.sendpingasync?view=net-7.0
#>



$serverIP = @('172.253.122.147', '74.6.231.21', '76.13.32.141', '172.253.115.190', '123.123.123.123') #google, yahoo, aol, youtube, nothing

    $Pingasync = foreach ($server in $ServerIP) {
        $p = [Net.NetworkInformation.Ping]::New()
        $asyn = $p.SendPingAsync($server, 250)
        $asyn | Add-Member -MemberType NoteProperty -Name Server -Value $server -PassThru
    }
    Start-Sleep -Seconds 2

    $PingResults = $pingAsync | ForEach-Object {

        $_ | 
        Select-Object -Expand result |
        Add-Member -MemberType NoteProperty -Name Server -Value $_.Server -PassThru
    }

    $PingResults | Select Server, Status
