######################################################################
#                                                                    #
#                           Audible Alerts                           #
#                                                                    #
######################################################################

# https://docs.microsoft.com/en-us/dotnet/api/system.console.beep?view=net-6.0

[console]::beep(784,150)
Start-Sleep -m 300
[console]::beep(784,150)
Start-Sleep -m 300
[console]::beep(932,150)
Start-Sleep -m 150
[console]::beep(1047,150)
Start-Sleep -m 150
[console]::beep(784,150)
Start-Sleep -m 300
[console]::beep(784,150)
Start-Sleep -m 300
[console]::beep(699,150)
Start-Sleep -m 150
[console]::beep(740,150)
Start-Sleep -m 150
[console]::beep(784,150)
Start-Sleep -m 300
[console]::beep(784,150)
Start-Sleep -m 300
[console]::beep(932,150)
Start-Sleep -m 150
[console]::beep(1047,150)
Start-Sleep -m 150
[console]::beep(784,150)
Start-Sleep -m 300
[console]::beep(784,150)
Start-Sleep -m 300
[console]::beep(699,150)
Start-Sleep -m 150
[console]::beep(740,150)
Start-Sleep -m 150
[console]::beep(932,150)
[console]::beep(784,150)
[console]::beep(587,1200)
Start-Sleep -m 75
[console]::beep(932,150)
[console]::beep(784,150)
[console]::beep(554,1200)
Start-Sleep -m 75
[console]::beep(932,150)
[console]::beep(784,150)
[console]::beep(523,1200)
Start-Sleep -m 150
[console]::beep(466,150)
[console]::beep(523,150)

######################################################################
#                                                                    #
#                         Talk to me please                          #
#                                                                    #
######################################################################

# https://docs.microsoft.com/en-us/dotnet/api/system.speech.synthesis.speechsynthesizer?view=netframework-4.8

Add-Type -AssemblyName System.Speech
$s = [System.Speech.Synthesis.SpeechSynthesizer]::new()
$s.Speak("Your new suit's a Mark VI, just came up from Songnam this morning. Try and take it easy 'til you get used to the upgrades.")

$voices = $s.GetInstalledVoices() | Select-Object -ExpandProperty voiceinfo
$voices

$s.SelectVoice($voices[1].Name)
$s.Speak("Captain, the cannon was my last defensive option.")

$s.SelectVoice($voices[0].Name)
$s.Speak("This class is bustin")

$answer = 5 + 100
$s.Speak("The answer is $answer")

$s.Speak("Aaaahhhh")


######################################################################
#                                                                    #
#                        Comment box function                        #
#                                                                    #
######################################################################


function New-CommentBox () {
    param([string]$titleText)
    $lines = $titleText.Split("`n")
    $output = "$("#"*70)`n"
    $output += "#$(" "*68)#`n"

    foreach($line in $lines){
        if($line.Length -gt 65){
            $line = $line.Substring(0,66)
        }
        $line = $line.Trim()
        $lspaces = ([math]::Floor((68-$line.trim().Length)/2))      
        $rspaces = (68-$lspaces-$line.Length)
        $output += "#$(" "*$lspaces)$($line.trim())$(" "*$rspaces)#`n"

    }
    $output += "#$(" "*68)#`n"
    $output += "$("#"*70)`n"
    return $output
}