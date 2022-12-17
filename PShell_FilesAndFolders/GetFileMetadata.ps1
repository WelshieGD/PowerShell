Function Get-FileMetaData 
{   
 Param([string[]]$folder) 
 foreach($sFolder in $folder) 
  { 
   $a = 0 
   $objShell = New-Object -ComObject Shell.Application 
   $objFolder = $objShell.namespace($sFolder) 

   foreach ($File in $objFolder.items()) 
    {  
     $FileMetaData = New-Object PSOBJECT 
     $hash += @{"Filename"  = $($objFolder.getDetailsOf($File, 0)) } 
     $hash += @{"My Comment field"  = $($objFolder.getDetailsOf($File, 24)) } 
     $hash += @{"Length" = $($objFolder.getDetailsOf($File, 24)).Length }
     $FileMetaData | Add-Member $hash 
     $hash.clear()  
    } #end foreach 

     $a=0 
     $FileMetaData 

  } #end foreach $sfolder 
} 

Get-FileMetaData -folder "C:\Temp" | fl