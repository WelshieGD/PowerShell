

$computers = Get-Content '\\dc1.langkah.net\software$\computers.txt'

$fileToCopy = '\\dc1.langkah.net\software$\FileToCopy.txt'

ForEach($computer in $Computers){

$destination = '\\$computer\Destination$\'

# Copy this to Program Files

Copy-Item -Path $fileToCopy -Destination $destination

}