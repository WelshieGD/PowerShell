Get-ChildItem "D:\Files"

# Name is default property
Get-ChildItem "D:\Files" | sort -Descending

# sort on other properties

Get-ChildItem "D:\Files" | sort -Property Length -Descending

# Longest
Get-ChildItem "D:\Files" | sort -Property Length -Descending | Select -First 1

# MOst recently modified (LastWriteTime)
Get-ChildItem "D:\Files" | sort -Property LastWriteTime -Descending | Select -First 1 | Select *

# Exrtact Property

$File = Get-ChildItem "D:\Files" | sort -Property LastWriteTime -Descending | Select -First 1 -Property IsReadOnly
$File

<#
PSPath              : Microsoft.PowerShell.Core\FileSystem::D:\Files\Text1 - Copy (5).txt 
PSParentPath        : Microsoft.PowerShell.Core\FileSystem::D:\Files
PSChildName         : Text1 - Copy (5).txt
PSDrive             : D
PSProvider          : Microsoft.PowerShell.Core\FileSystem
PSIsContainer       : False
Mode                : -a---
ModeWithoutHardLink : -a---
VersionInfo         : File:             D:\Files\Text1 - Copy (5).txt
                      InternalName:
                      OriginalFilename:
                      FileVersion:
                      FileDescription:
                      Product:
                      ProductVersion:
                      Debug:            False
                      Patched:          False
                      PreRelease:       False
                      PrivateBuild:     False
                      SpecialBuild:     False
                      Language:

BaseName            : Text1 - Copy (5)
Target              : 
LinkType            : 
Length              : 2
DirectoryName       : D:\Files
Directory           : D:\Files
IsReadOnly          : False
FullName            : D:\Files\Text1 - Copy (5).txt
Extension           : .txt
Name                : Text1 - Copy (5).txt
Exists              : True
CreationTime        : 13/09/2022 13:34:13
CreationTimeUtc     : 13/09/2022 12:34:13
LastAccessTime      : 13/09/2022 13:38:40
LastAccessTimeUtc   : 13/09/2022 12:38:40
LastWriteTime       : 13/09/2022 13:38:40
LastWriteTimeUtc    : 13/09/2022 12:38:40
LinkTarget          : 
Attributes          : Archive

#>