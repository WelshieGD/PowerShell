# gcm | Where Name -like '*SCOM*'

# Make sure in PowerShell (Windows PowerShell) and not in pwsh (PowerShell Core)

Import-Module OperationsManager

New-SCOMManagementGroupConnection -ComputerName SCOMMS.Langkah.net

Get-SCOMManagementPack -Name Microsoft.SystemCenter.OperationsManager.DefaultUser | Select Name, DisplayName, LastModified

$DefaultMPLastModified = Get-SCOMManagementPack -Name Microsoft.SystemCenter.OperationsManager.DefaultUser |  Select-Object -ExpandProperty  LastModified

If  (((Get-Date)-$DefaultMPLastModified).Day -lt 1) {write-output "File Changed in Last day"}

<#
PS C:\Users\graham\Source\Repos\PowerShell\PShell_SCOM_MPChecks> $DefaultMPLastModified.GetType()
IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     False    PSCustomObject                           System.Object


PS C:\Users\graham\Source\Repos\PowerShell\PShell_SCOM_MPChecks> $DefaultMPLastModified | Get-Member


   TypeName: Selected.Microsoft.EnterpriseManagement.Configuration.ManagementPack

Name         MemberType   Definition
----         ----------   ----------
Equals       Method       bool Equals(System.Object obj)
GetHashCode  Method       int GetHashCode()
GetType      Method       type GetType()
ToString     Method       string ToString()
LastModified NoteProperty datetime LastModified=24/03/2023 08:24:20

#>

If  (((Get-Date)-$DefaultMPLastModified).Day -lt 1) {write-output "File Changed in Last day"}