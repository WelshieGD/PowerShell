<#
Test-NetConnection can also test ports
Test-Connection cannot do a port check
#>
$serverIP = @('172.253.122.147', '74.6.231.21', '76.13.32.141', '172.253.115.190', '123.123.123.123') #google, yahoo, aol, youtube, nothing


ForEach ($IP in $ServerIP)
{
  $Results = Test-NetConnection $IP | Select RemoteAddress, PingSucceeded 
  $Results
}






 