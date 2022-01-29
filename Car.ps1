class car2 
{
    [string]$audio = "Radio"
    [string[]]$instruments = "saxaphone","flute"

    [void] Play($freq=1000, $duration=500) {
        [console]::beep($freq,$duration)
    }
}