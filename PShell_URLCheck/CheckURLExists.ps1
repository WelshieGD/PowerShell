# First we create the request.
$HTTP_Request = [System.Net.WebRequest]::Create('http://google.com')

# We then get a response from the site.
$HTTP_Response = $HTTP_Request.GetResponse()

# We then get the HTTP code as an integer.
$HTTP_Status = [int]$HTTP_Response.StatusCode

If ($HTTP_Status -eq 200) {
    Write-Host "Site is OK! - Status Code is $HTTP_Status"
}
Else {
    Write-Host "The Site may be down, please check! - Status Code is $HTTP_Status"
}

# Finally, we clean up the http request by closing it.
If ($HTTP_Response -eq $null) { } 
Else { $HTTP_Response.Close() }

<#
$HTTP_Response
IsMutuallyAuthenticated : False
ContentLength           : -1
ContentType             : text/html; charset=ISO-8859-1
ContentEncoding         : 
Cookies                 : {}
LastModified            : 21/12/2022 07:57:13
Server                  : gws
ProtocolVersion         : 1.1
Headers                 : {Date, Cache-Control, Cross-Origin-Opener-Policy-Report-Only, Report-To…}
Method                  : GET
ResponseUri             : http://www.google.com/
StatusCode              : OK
StatusDescription       : OK
CharacterSet            : ISO-8859-1
SupportsHeaders         : True
IsFromCache             : False
#>