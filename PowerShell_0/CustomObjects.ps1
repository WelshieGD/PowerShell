# custom objects in an array

$bassplayers = @(
    [PSCustomObject]@{FirstName = 'Peter'; LastName = 'Hook'; Band = 'Joy Division'}
    [PSCustomObject]@{FirstName = 'Duff'; LastName = 'McKagan' ; Band = 'Guns and Roses'}
    [PSCustomObject]@{FirstName = 'Kim'; LastName = 'Deal' ; Band = 'Pixies'}
    [PSCustomObject]@{FirstName = 'Kim'; LastName = 'Gordon' ; Band = 'Sonic Youth'}
    [PSCustomObject]@{FirstName = 'Tina'; LastName = 'Weymouth' ; Band = 'Talking Heads'}
    [PSCustomObject]@{FirstName = 'John'; LastName = 'Entwhistle' ; Band = 'The Who'}
)
# One bass player
$bassplayers[0].FirstName + ' ' + $bassplayers[0].LastName
# Last name of all bass players
$bassplayers.LastName
# Filtering
$bassplayers | Where-Object FirstName -eq 'Kim'
# OR
$bassplayers.Where({$_.FIrstName -eq 'Kim'})


# Passing values to another cmdlet e.g. service, computer
$serviceObject = [PSCustomObject]@{Name = 'wuauserv'; ComputerName = 'SERV1'}
$serviceObject | Get-Service