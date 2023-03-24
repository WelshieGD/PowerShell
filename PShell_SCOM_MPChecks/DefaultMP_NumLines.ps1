$Path = "C:\SCOMTemp\"
$FileName = "Microsoft.SystemCenter.OperationsManager.DefaultUser.xml"

# Check if the last character of $Path is a backslash and if not, add one.
if ($Path -notmatch '\\$')
{
$Path += '\'
}

$FullPath = $Path+$FileName

# Count the Number of Characters in the File
$NumChars = (Get-Content $FullPath | Measure-Object -Character).Characters

Write-Host "Number of Characters In File $FullPath = " $NumChars

If ($NumChars -ne 69898)
{
    Write-Host "File has been changed"
}
Else
{
    Write-Host "File has the same number of characters as last time"
}
<#

Measure-Object returns a TextMeasureInfo object, not an integer:
$Path = "C:\SCOMTemp\"
$FileName = "Microsoft.SystemCenter.OperationsManager.DefaultUser.xml"
$FullPath = $Path+$FileName
$Characters = Get-Content $FullPath | Measure-Object -Character
$Characters.GetType()
$Characters | Get-Member

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     False    TextMeasureInfo                          Microsoft.PowerShell.Commands.MeasureInfo

PS C:\Users\graham\Source\Repos\PowerShell\PShell_SCOM_MPChecks> $Characters | Get-Member

   TypeName: Microsoft.PowerShell.Commands.TextMeasureInfo

Name        MemberType Definition
----        ---------- ----------
Equals      Method     bool Equals(System.Object obj)
GetHashCode Method     int GetHashCode()
GetType     Method     type GetType()
ToString    Method     string ToString()
Characters  Property   System.Nullable[int] Characters {get;set;}
Lines       Property   System.Nullable[int] Lines {get;set;}
Property    Property   string Property {get;set;}
Words       Property   System.Nullable[int] Words {get;set;}


#>