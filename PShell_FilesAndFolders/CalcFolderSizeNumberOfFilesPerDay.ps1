<#
Counts number of files in a folder by datelastmodified and gives a count + Size (MB) by day
- NOT RECURSIVE --> Doesn't include sub folders

Name       Count Sum Size(MB)
----       ----- ------------
01.08.2022     1         0.00
20.08.2022     1         0.01
21.12.2022     2         0.00
23.12.2022     4         0.00

#>

Get-ChildItem -file -Path 'c:\temp' | Select-Object Name,FullName, Length, @{Name="LastModifiedTime"; Expression={$_.LastWriteTime.ToString("dd.MM.yyyy")}} | group-object -Property LastModifiedTime | Select-Object Name,Count,@{n='Sum Size(MB)';e={ ($_.Group|Measure-Object -Property Length -Sum).Sum/1MB }}

<# 
-Recurse will count files included in sub-folders but doesn't break down by folder

Get-ChildItem -file -Path 'c:\temp' -Recurse | Select-Object Name,FullName, Length, @{Name="LastModifiedTime"; Expression={$_.LastWriteTime.ToString("dd.MM.yyyy")}} | group-object -Property LastModifiedTime | Select-Object Name,Count,@{n='Sum Size(MB)';e={ ($_.Group|Measure-Object -Property Length -Sum).Sum/1MB }}


Name       Count Sum Size(MB)
----       ----- ------------
01.08.2022     1         0.00
19.12.2022     1         0.00
20.08.2022     1         0.01
21.12.2022     2         0.00
22.02.2022  2661       697.51
23.12.2022     4         0.00

#>