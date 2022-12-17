
# WMI Local
$ServerNameWMI = Get-CimInstance -ClassName Win32_ComputerSystem
$ServerNameWMI
$ServerNameWMI.Name
$ServerNameWMI.Domain