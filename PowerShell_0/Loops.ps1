<#
For Loops, While Loops , Do While, Do Until
For = loop a predetermined number of times
While = loop while condition is true  (can use break to exit loop)

#>

#region For Loop

# For (Starting Value; Condition to run loop; action to perform after loop runs succesfully)
# { code to execute}

for ($i = 0; $i -lt 10; $i++) {
    $i
}

#endregion


#region while loop
$counter = 0
while ($counter -lt 10) {
    $counter
    $counter++
}

#  List out odd \ even numbers between 1 and 9
$i=0
while ($i++ -lt 10) { if ($i % 2) {"$i is odd"}}

#or 

foreach ($i in 1..10) { if ($i % 2) {"$i is odd"}}

#or

1..10 | foreach { if ($_ % 2) {"$_ is odd"}}


#endregion

#region do while loop
$counter = 0
do  {
    $counter
    $counter++
}
while ($counter -lt 10)

#endregion


#region do until loop - need to change condition
$counter = 0
do  {
    $counter
    $counter++
}
until ($counter -gt 9)

#endregion