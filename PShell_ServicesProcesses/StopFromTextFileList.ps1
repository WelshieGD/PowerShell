
#region textfile

'Background Intelligent Transfer Service', 'Windows Time' | Out-File -FilePath $env:TEMP\services.txt

Stop-Service -DisplayName -PassThru (Get-Content -Path $env:TEMP\services.txt) 

#endregion textfile