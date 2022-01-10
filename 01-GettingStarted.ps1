# Variable assignment

$a = 1

$b = 2

$c = $a + $b

$d = "test"

$a + $d

# Common Types

$a = "String"
$array = @("one", "two", "three")
$array2 = @("red", "white", "blue")


$complexArray = @($array, $array2)

$array[0]

$array[1]

$complexArray[0][1]

$hash = @{
    a = "test";
    b = "snap";
}

$hash["a"]

$bool = $true 
$bool2 = $false 

# Built in CmdLets

Get-Process

Get-Service

Get-Disk


# Loops

for ($i=0;$i -lt 3; $i++)
{
    $i
}

foreach ($a in 1..5)
{
    Write-Host $a -ForegroundColor White
}

while($i -lt 4)
{
    $i
    $i++
}

do {
    $i
} while ($i -lt 2)

# if and switch 

if($i -eq 4)
{
    Write-Host "This only prints with 4" -ForegroundColor Yellow
}

switch( $i )
{
    1 {
        Write-Host "Red" -ForegroundColor Red
    }
    4 {
        Write-Host "Blue" -ForegroundColor Blue
    }
    default {
        Write-Host "Green" -ForegroundColor Green
    }
}

# Regular expressions and looking for strings

Select-String -Path .\01-GettingStarted.ps1 -Pattern '\$i'

"test" -match "es"

"test" -match "esk"

# Looking for files 

Get-ChildItem 'C:\Program Files' -Depth 0

Get-ChildItem 'C:\Program Files' -Depth 1 -Include "*.exe" | Select -first 10 | Select -Property Name

Get-ChildItem 'C:\Program Files' -Depth 1 -Include "*.exe" | Select -first 10 | Select -ExpandProperty Name

Get-ChildItem 'C:\Program Files' -Depth 1 -Include "*.exe" | Select -first 10 | Select -ExpandProperty Name | Sort-object 

# Saving to a file 

Get-Service | ogv 

Get-Service | Out-GridView -PassThru | Out-file c:\temp\MyServicesSelected.txt

# Functions

function Get-CService {
    Get-Service | Sort-Object Status
}

function Get-MyService {
    param(
        $Name
    )

    Get-Service -Include "$Name"
}

# Build a logging function