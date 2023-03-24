

$Path = "C:\Program Files (x86)\System Center Management Packs\SC Management Pack for Windows Server Operating System"

Import-Module OperationsManager

# New-SCOMManagementGroupConnection -ComputerName SCOMMS.Langkah.net

$ManagementServer = "SCOMMS.Langkah.net"
$MG = New-Object Microsoft.EnterpriseManagement.ManagementGroup($ManagementServer)

$MPDisplayName = "Windows Server 2003 Operating System"
$MPName = "Microsoft.Windows.Server.2003"

$OverridesMPDisplayName = "Windows Server 2003 Operating System - Overrides"
$OverridesMPName = "Microsoft.Windows.Server.2003.Overrides"


$MP = Get-SCOMManagementPack | Where Name -eq $MPName | Select Name, Sealed, DisplayName

If (($MP.Sealed -eq $True ) -and ($MP.DisplayName -eq $MPDisplayName))
{
    Write-Host "MPFound"

    If (Get-SCOMManagementPack | Where Name -eq $OverridesMPName)
    {
        Write-Host "Overrides MP already exists"
    }
    Else
    {
        Write-Host "Overrides MP does not exist"
        $MPStore = New-Object Microsoft.EnterpriseManagement.Configuration.IO.ManagementPackFileStore
        $OverridesMP = New-Object Microsoft.EnterpriseManagement.Configuration.ManagementPack($OverridesMPName, $OverridesMPDisplayName, (New-Object Version(1, 0, 0)), $MPStore)
        $MG.ImportManagementPack($OverridesMP)
        $MP = $MG.GetManagementPacks($OverridesMPName)[0]
        $MP.DisplayName = $OverridesMPDisplayName
        $MP.Description = "Auto Generated Management Pack for Overrides for " + $MPDisplayName
        $MP.AcceptChanges()
        Write-Host $OverridesMPDisplayName " imported to Management Group"
    }
}

<#
Started working on doing from file before import but not worth it as name of MP file doesn't equal MP name
$MPs = Get-ChildItem -Path $Path 
ForEach ($mp in $MPs)
{
    If ($mp.name -match '.mp$')
   {
    $MPName = $mp.Name
    
    $OverridesMPName = $mp.name.TrimEnd(".mp") + ".Overrides"
    
    Write-Host $MPName
    write-Host $OverridesMPName
   }
} 
#>