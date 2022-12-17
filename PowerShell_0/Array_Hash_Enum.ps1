#region array

$day = 3

$lookup = @(
    [PSCustomObject]@{numday = 0; Day = 'Sunday'}
    [PSCustomObject]@{numday = 1; Day = 'Monday'}
    [PSCustomObject]@{numday =  2; Day = 'Tuesday'}
    [PSCustomObject]@{numday = 3; Day = 'Wednesday'}
    [PSCustomObject]@{numday = 4; Day = 'Thursday'}
    [PSCustomObject]@{numday = 5; Day = 'Friday'}
    [PSCustomObject]@{numday = 6; Day = 'Saturday'}
)

$TheDay = $lookup[$day]
$TheDay.Day 

#endregion


#region hashtable
$day = 3

$lookup = @{
    0 = 'Sunday'
    1 = 'Monday'
    2 = 'Tuesday'
    3 = 'Wednesday'
    4 = 'Thursday'
    5 = 'Friday'
    6 = 'Saturday'
}

$lookup[$day]

#endregion

#region enum

$day = 3

enum DayOfTheWeek {
    Sunday
    Monday
    Tuesday
    Wednesday
    Thursday
    Friday
    Saturday
}

[DayOfTheWeek]$day

#endregion