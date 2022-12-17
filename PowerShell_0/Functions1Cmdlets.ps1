<#
A cmdlet isn’t written with PowerShell. 
It’s written in another language, typically something like C#, and then 
it’s compiled and made available inside PowerShell. 
Functions, on the other hand, are written in PowerShell’s 
simple scripting language.
#>

# Get-Command -CommandType Function
# Get-Command -CommandType Cmdlet
# Use of AsSecureString

<#Function Get-Version {
    [CmdletBinding()]
    param()
    $PSVersionTable.PSVersion | Write-Information
}

$InformationPreference = 'Continue'
Get-Version
#>

Function Get-VersionParam {
    [CmdletBinding()]
    param(
        # Defaults won't work with madatory parameters
        [parameter(Mandatory)][securestring]$Version
        
        # Defaults if required are specified this way
        #[parameter()][string]$Version = 2
    )

    "`nObject Type `t $Version `n" | Write-Information
    $VersionText = ConvertFrom-SecureString $Version -AsPlainText

    "Plain text `t $VersionText `n" | Write-Information 
    $VersionOutput = ConvertFrom-SecureString $Version

    "Encrypted Text `t $VersionOutput" | Write-Information 
   
}

$InformationPreference = 'Continue'

# Can do as secure string to replace number with * when entered
# Output will be System.Security.SecureString rather than the number
$inputValue = Read-Host "Enter a number between 1 and 100" -AsSecureString

# Just enter value as string
# $inputValue = Read-Host "Enter a number between 1 and 100"

Get-VersionParam $inputValue

