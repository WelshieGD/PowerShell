$total = 0
Get-ChildItem "D:\Files" | ForEach-Object {$total += $_.length }
$total