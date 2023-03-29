<#
https://philipsfieldexperience.wordpress.com/2018/10/24/scom-api-powershell/

#>

param($MS)
 
# authentication part
 
$scomHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$scomHeaders.Add('Content-Type','application/json; charset=utf-8')
 
$bodyraw = "Windows"
$Bytes = [System.Text.Encoding]::UTF8.GetBytes($bodyraw)
$EncodedText =[Convert]::ToBase64String($Bytes)
$jsonbody = $EncodedText | ConvertTo-Json

$uri = "http://$MS/OperationsManager/authenticate"
 
$Request = Invoke-WebRequest `
    -Method POST `
    -Uri $uri `
    -Headers $scomHeaders `
    -body $jsonbody `
    -UseDefaultCredentials `
    -SessionVariable 'websession'
 
# Initialize the CSRF token if using SCOM 2019 UR1, else safe to ignore
 
foreach($value in $Request.Headers["Set-Cookie"].Split(";"))
{
    if ($value.contains("SCOM-CSRF-TOKEN"))
    {
        $ScomCsrfTokenValue = [System.Web.HttpUtility]::UrlDecode($value.Split("=")[1])
    }
}
 
# if using SCOM 2019 UR1 the line below is needed, ELSE just comment it
 
$scomHeaders.Add('SCOM-CSRF-TOKEN',$ScomCsrfTokenValue)
 
# data below is for all alerts, not filtered per group
 
$data = @"
{
    "classId": null,
    "objectIds": { },
    "criteria": "(ResolutionState = '0')",
    "displayColumns": [
        "id","severity", "monitoringobjectdisplayname", "monitoringobjectpath", "name", "age", "description", "owner", "timeadded"
    ]
}
"@
 
$uri = "http://$MS/OperationsManager/data/alert"
 
$Response = Invoke-WebRequest `
    -Method POST `
    -Uri $uri `
    -Body $data `
    -Headers $scomHeaders `
    -UseDefaultCredentials `
    -WebSession $websession
 
$alerts = ConvertFrom-Json -InputObject $Response.Content
write-host "Active alerts found: "$alerts.rows.count