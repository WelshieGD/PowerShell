# Import CSV file
$RemoveHeader = Get-Content -Path C:\temp\excel\Book1.csv 

# Find nulls in Name1 column and update them with the value in the Name column
foreach ($row in $RemoveHeader) {
    $row.Name
    if ($row[1] -eq $null) {
        $row[1] = $row[0]
        Write-Host "updating value in excel"
    }
}

# Remove Header and Save
$RemoveHeader = $RemoveHeader[1..($RemoveHeader.Count - 1)]

$RemoveHeader | Out-File -FilePath C:\temp\excel\Book1NoHeader.csv 

# Import file cleansed of headers and remove duplicates
$UniqueRows =  Import-CSV -Path C:\Temp\excel\Book1NoHeader.csv -Header Name, Name2, Code | sort Name,Code -Unique

$UniqueRows | Export-Csv c:\temp\excel\rippedBook1.csv 