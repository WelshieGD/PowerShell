<#
From PowerShell v4; .foreach method is available for arrays
https://mcpmag.com/articles/2016/07/06/powershell-code-for-performance.aspx
#>

Measure-Command {
$InformationPreference = 'Continue'

$cars = @('Ford','BMW','VW','Skoda')

# .foreach method is best if you already have the data collected in some variable. 
# Requires more memory and results aren't visible until all input data complete
# Like downloading a video before you can watch it. 

$cars.ForEach(
    {
   # $_ - current value in pipeline
   $_ | Get-Member # string
   $_ | Write-Information 
    }   
   )
}


Measure-Command {

$InformationPreference = 'Continue'
$cars = @('Ford','BMW','VW','Skoda')

foreach($car in $cars)
    {
   # $car as it is TypeName: System.String
   #$car | Get-Member     
   $car | Write-Information 
    }   
}

# ForEach-Object
   # Generally much slower than above
   # Results appear as they are processed - only memory needed is to process current record
   # This may appear faster as it is like streaming a video (user can start seeing results come in straight away)
   # If pipeline is blocker e.g. reading values from a remote data store then may not be any slower than foreach and will appears quicker to user as results will update on screen as they are processed.

   Measure-Command {

    $InformationPreference = 'Continue'
    $cars = @('Ford','BMW','VW','Skoda')
    
   $cars | foreach-object {
       #$car | Get-Member     
       $cars | Write-Information 
        }   
   }