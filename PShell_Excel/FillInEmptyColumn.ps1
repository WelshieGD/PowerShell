# Import CSV file
$ExcelData = Import-CSV -Path C:\temp\excel\Book1.csv 

foreach ($row in $ExcelData) {
    $count = 0
    if ($row[$Count].Name2 -eq "") {
        $row[$Count].Name2 = $row[$Count].Name
        Write-Host $row[$Count]
        $count=$count+1
    }
}

$ExcelData
$UniqueRows =  $ExcelData | sort Name,Code -Unique


#$UniqueRows

# Remove Header and Save
#$RemoveHeader = $RemoveHeader[1..($RemoveHeader.Count - 1)]

#$RemoveHeader | Out-File -FilePath C:\temp\excel\Book1NoHeader.csv 

# Import file cleansed of headers and remove duplicates
# $UniqueRows =  Import-CSV -Path C:\Temp\excel\Book1NoHeader.csv -Header Name, Name2, Code | sort Name,Code -Unique

$UniqueRows | Export-Csv c:\temp\excel\rippedBook1.csv -NoTypeInformation