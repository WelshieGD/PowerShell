


$File = 'c:\temp\export.csv'
$hash = $null
$hash = @{}

$Streams = Get-Item -Path $File -Stream * | Select-Object -ExpandProperty Stream -Unique

ForEach ($Stream in $Streams)
{  

$Value = Get-Content -Path $file -stream $Stream
$hash.add($stream,$Value)

}

$hash