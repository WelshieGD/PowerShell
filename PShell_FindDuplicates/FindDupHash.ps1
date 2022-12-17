#Contains - https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.3

<#
Containment relates to collections

-contains, -icontains, -ccontains - collection contains a value
-notcontains, -inotcontains, -cnotcontains - collection does not contain a value
-in - value is in a collection
-notin - value is not in a collection

ID,Hash,Path
12,262018D745C299464B635D1FE07D2391ABBCE8A072B4D535BB079BD239050056,c:\path\filename1.txt
23,F5813AEBB032C8292C96FA910B3C04C695BCBC2716828CE8F197EC7D89CCAA43,c:\path\filename2.txt
35,2F9F39BD822F87FE3FEABEA4692787460FB78313A6621398BC6A4EEAA6BC73BB,c:\path\filename3.txt
43,1C366EADE429017E1BC5F829B5AAA6501F38ADC8AEC8A9CB0077C87C5BF9BA60,c:\path\filename4.txt
56,BB60696743D8FBDB2B51228941EB3B88DA971FFAEAEEDF73B04B5D3863E46555,c:\path\filename5.txt


#>

$hash = get-filehash "C:\Users\graham\source\repos\PowerShell\PowerShell\ForEachObject.ps1" -algorithm SHA256 | select-object -expandproperty hash
# $hash = get-filehash "C:\Temp\export.csv" -algorithm SHA256 | select-object -expandproperty hash

$database = "ListFiles.csv"

$importdatabase = import-csv $database

# Option 1 -  The main problem with it is that everytime you run this command, it will have to go and create an array from unrolling $importdatabase.hash. 
#if ($importdatabase.hash -contains $hash) {"Hash is already in!"}
#else {"Hash is not in yet"}

# Option 2 - Create array yourself
$hashes = $importdatabase.hash
if ($hashes -contains "$hash") {Write-Host "Hash $hash is already in!" -BackgroundColor Green}
else {Write-Host "Hash $hash is not in yet" -BackgroundColor Red}