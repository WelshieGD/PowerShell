$even, $odd = (1..10).where({$_ % 2 -eq 0}, "Split")

<#
PS C:\Users\graham> $even
2
4
6
8
10
PS C:\Users\graham> $odd
1
3
5
7
9

#>

$even -join ","
$odd -join ","

<#

PS C:\Users\graham> $even -join ","
2,4,6,8,10
PS C:\Users\graham> $odd -join ","
1,3,5,7,9

#>