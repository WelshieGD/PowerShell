$fileContent = Get-Content "C:\Users\graham\Source\Repos\PowerShell\PShell_StringManipulation\Codes - Copy.txt"
$OldValue = "/cbc"
$NewValue = "/xxx"
$fileContent = $fileContent.Replace($OldValue, $NewValue)


Set-Content "C:\Users\graham\Source\Repos\PowerShell\PShell_StringManipulation\Codes2.txt" -Value $fileContent