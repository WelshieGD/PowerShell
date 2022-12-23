Function TestMe {

    <#
    The following will not be written to the output stream and back outside of the function
    As they are variables $x and $y
    $x = New-Item -Path 'c:\temp\file1.txt'
    $x
    #>
    <#
    $y = New-Item -Path 'C:\temp\file2.txt'
    $y 
    Write-Output 'Test'
    #>

    # These will be written to the output stream and back out of the function with potentiall unwanted implications

    New-Item -Path 'c:\temp\file1.txt'
    New-Item -Path 'C:\temp\file2.txt'
    
# Can use | Out-Null to prevent being returned by function - doesn't impact error or verbose stream
# Can use Return to exit function but be aware that due to above, it might not only be the object returned


    }
    
    $z = TestMe
    
    Write-Output $z