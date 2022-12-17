Set-StrictMode -Version 3

# An array is prefixed with @ sign - a list (or collection) of values or objects
# When you modify an array, PowerShell creates a new array (dstroys old one) - arrays in PowerShell have a fixed size
# If you want to create a dynamic array then use an ArrayList
# Examples include custom objects in an array or used as a hashtable

# hashtable = key \ value pair 
# Use braces rather than brackets
# Used as a lookup table

#region array
# https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-arrays?view=powershell-7.2

$cars = @('Ford','BMW','VW','Skoda')
$cars

# Pick a specific index (zero based so 2 = 3rd item in array)
$cars[2]  # = VW

# First 3 items in the array 
$cars[0..2]

# Last Item 
$cars[-1]

# Modify an element
$cars[1] = 'Mercedes'
$cars

# Add elements to an array
$cars += 'BMW','Renault', 'Citreon'
$cars

# Add an array to an array
$cars += @('Honda','Toyota')
$cars

# Count Method to determine size of array
$numcars = $cars.Count
$numcars

# foreach
foreach ($car in $cars)
{
    $car
}

# custom objects in an array

$bassplayers = @(
    [PSCustomObject]@{FirstName = 'Peter'; LastName = 'Hook'; Band = 'Joy Division'}
    [PSCustomObject]@{FirstName = 'Duff'; LastName = 'McKagan' ; Band = 'Guns and Roses'}
    [PSCustomObject]@{FirstName = 'Kim'; LastName = 'Deal' ; Band = 'Pixies'}
    [PSCustomObject]@{FirstName = 'Kim'; LastName = 'Gordon' ; Band = 'Sonic Youth'}
    [PSCustomObject]@{FirstName = 'Tina'; LastName = 'Weymouth' ; Band = 'Talking Heads'}
    [PSCustomObject]@{FirstName = 'John'; LastName = 'Entwhistle' ; Band = 'The Who'}
)
# One bass player
$bassplayers[0].FirstName + ' ' + $bassplayers[0].LastName
# Last name of all bass players
$bassplayers.LastName
# Filtering
$bassplayers | Where-Object FirstName -eq 'Kim'
# OR
$bassplayers.Where({$_.FIrstName -eq 'Kim'})


#endregion array

#region arraylist
$cars = [System.Collections.ArrayList]@('Ford','BMW','VW','Skoda')
$cars

# Add to an array list
$cars.Add('Mercedes')
$cars

#Remove an element from an array list
$cars.Remove('Skoda')
$cars

#endregion arraylist

#region hashtable
# Also known as a dictionary - key value pairs (rather than an index)
# Key must be unique
# https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-hashtable?view=powershell-7.2
# {} rather than ()
$employees = @{}
$employeeid = 123
$name = 'Bob the Builder'
$employees.Add($employeeid,$name)
$employees

$employees.Add(124,'Thomas the Tank Engine')
$employees

# As a lookup table

$environments = @{
    ProdCluster = "myappliv"
    StagingCluster = "myappstg"
    DevCluster = "myappdev"
}

$environment = 'ProdCluster'
$server = $environments[$environment]
$server

# Can submit multiple values
$environment = 'ProdCluster', 'StagingCluster'
$server = $environments[$environment]
$server

# How many values in Hashtabl
$environments.Count

# Average out values
$goalsScored = @{}
$goalsScored.Add('Shreswbury Town', 28)
$goalsScored.Add('Bolton Wanderers', 22)
$goalsScored.Add('Plymouth', 40)

$goalsScored.Values | Measure-Object -Average -Sum -Maximum -Minimum

# Iterate and use string interpolation
# Use -f to format 

$goalsScored.Keys | ForEach-Object {
    $message = '{0} scored {1} goals last season' -f $_, $goalsScored[$_]
    Write-Output $message
}

# With ForEach
foreach ($key in $goalsScored.Keys)
{
    $message = '{0} scored {1} goals last season' -f $key, $goalsScored[$key]
    Write-Output $message
}

# Get-Enumerator
$goalsScored.GetEnumerator() | ForEach-Object {
    $message = '{0} scored {1} goals last season' -f $_.key, $_.value
    Write-Output $message
}

# Using hash tables and splatting
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting?view=powershell-7.2

$DHCPScope = @{
    Name        = 'TestNetwork'
    StartRange  = '10.0.0.2'
    EndRange    = '10.0.0.254'
    SubnetMask  = '255.255.255.0'
    Description = 'Network for testlab A'
    LeaseDuration = (New-TimeSpan -Days 8)
    Type = "Both"
}
Add-DhcpServerv4Scope @DHCPScope


#endregion hashtable