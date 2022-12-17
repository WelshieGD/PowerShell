# Only certain files have File Description e.g. .exe files (create a C# service and set FileDescription there)

# Change the current directory to the System folder
cd C:\Temp_WindowsServices\

# Display all executable files along with their file description
get-childitem * | foreach-object {
    "{0}, {1}" -f $_.Name,
    [System.Diagnostics.FileVersionInfo]::GetVersionInfo($_).FileDescription }