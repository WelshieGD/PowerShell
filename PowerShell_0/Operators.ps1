<#
https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.2#logical-operators
Comparison operators: -ge -lt -ne -eq -in -contains -like -match
Logical operators -not (or !) -and
#>

#region comparison operators

<#
Here’s a list of the most common comparison operators you’ll use:

-eq Compares two values and returns True if they are equal.

-ne Compares two values and returns True if they are not equal.

-gt Compares two values and returns True if the first is greater than the second.

-ge Compares two values and returns True if the first is greater than or equal to the second.

-lt Compares two values and returns True if the first is less than the second.

-le Compares two values and returns True if the first is less than or equal to the second.

-in 
-iin
-cin
-notin

-contains Returns True if the second value is “in” the first. You can use this to determine whether a value is inside an array.
-icontains
-ccontains 
-notcontains 

-like ? single character or * for any number of characters
-ilike for case insenstive wildcard
-clike for case sensitive wildcard
-notlike for wildcard not matched (can use i \ c for case insensitive or sensitive)

-match based on regular expression
#>

#endregion

#region logical operators
$InformationPreference = 'Continue' 
if (-not (Test-Path -Path c:\temp\myfile.txt))
{
    Write-Information "File Doesn't exist"
   "File Doesn't exist" |  Write-Information
}   

# This is the same as above using ! instead of -not
$InformationPreference = 'Continue' 
if (!(Test-Path -Path c:\temp\myfile.txt))
{
    Write-Information "File Doesn't exist"
   "File Doesn't exist" |  Write-Information
}   

# -and \ -or
$InformationPreference = 'Continue' 
$a = 1
$b = 5

if (($a -gt 2) -and ($b -gt 3 ))
{
    "Both conditions met" | Write-Information
}
elseif (($a -gt 2) -or ($b -gt 3)) 
{
    "One condition met" | Write-Information
}


#endregion
