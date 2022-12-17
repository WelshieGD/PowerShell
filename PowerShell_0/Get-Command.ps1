# Get All Commands
Get-Command

# Get a specific command
Get-Command -Name Get-Service | Select-Object *

# Get All commands with specific verb
Get-Command -Verb Get

#Get All commands with a specific noun
Get-Command -Noun Content

