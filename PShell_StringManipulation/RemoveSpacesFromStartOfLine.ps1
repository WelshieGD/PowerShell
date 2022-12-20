
<# Doesn't remove lines with spaces but no other text

$wholefile = Get-Content 'c:\temp\spaces.txt'

foreach ($line in $wholefile)
{
 $B += $line.TrimStart() + "`r`n"
}

 $B  | out-file 'c:\temp\nospaces.txt' 

 #>

 
$wholefile = Get-Content 'c:\temp\spaces.txt' | Where-Object {$_.trim() -ne ""}

foreach ($line in $wholefile)
{

 $B += $line.TrimStart() + "`r`n"
}

 $B  | out-file 'c:\temp\nospaces.txt' 
