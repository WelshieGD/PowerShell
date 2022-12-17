<#
https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.2
#>

# if , elseif, else , switch

#region if, else if, else

<#if (condition)
{
    Code to run if condition is true
}
#>

$sports = @('Rugby Union','Football','Cricket','Rugby League','Athletics','Golf')

$VerbosePreference = 'Continue'
if ($sports.Count -lt 5)
{
    "Less than 5 sports listed" | Write-Verbose
}
elseif ($sports.Count -gt 5)
{
    "More than 5 sports listed" | Write-Verbose
}
else # can't have any conditions ... 
{
    "5 sports listed" | Write-Verbose
}

#endregion

#region switch statement

# https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-switch?view=powershell-7.2

# With a variable

$VerbosePreference = 'Continue'
$sports = @('Rugby Union','Football','Cricket','Rugby League','Athletics','Golf')
$numsports = $sports.Count

switch ($numsports)
{
 0 {'No sports listed' | Write-Verbose}
 1 {'One sport listed' | Write-Verbose}
 2 {'Tow sports listed' | Write-Verbose}
 3 {'Three sport listed' | Write-Verbose}
 4 {'Four sports listed' | Write-Verbose}
 5 {'Five sport listed' | Write-Verbose}
 6 {'Six sport listed' | Write-Verbose}
 default {'More than six sports listed'}
}

# But can do arrays directly - and will process for each element

$roles = @('WEB','Database')

switch ( $roles ) {
    'Database'   { 'Configure SQL' }
    'WEB'        { 'Configure IIS' }
    'FileServer' { 'Configure Share' }
}

# To exit after first match, use break

$roles = @('WEB','Database')

switch ( $roles ) {
    'Database'   { 'Configure SQL'; break}
    'WEB'        { 'Configure IIS'; break }
    'FileServer' { 'Configure Share';break }
}

# Strings
$item = 'Role'

switch ( $item )
{
    Component
    {
        'is a component'
    }
    Role
    {
        'is a role'
    }
    Location
    {
        'is a location'
    }
}

#endregion