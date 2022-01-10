<#

Computer Configuration/Administrative Templates/Control Panel/Personalization/Do not display the lock screen

Use Procmon to find the registry path

Open Registry Editor

Use PowerShell to update the value

#>



<#

LGPO Backup 

 cd "C:\Tools\Microsoft Security Compliance Toolkit\LGPO\LGPO_30"
 .\LGPO.exe /b C:\temp\LGPOBackup


 .\LGPO.exe /parse /m "C:\Windows\System32\GroupPolicy\Machine\Registry.pol"
 .\LGPO.exe /parse /u "C:\Windows\System32\GroupPolicy\User\Registry.pol"

User Configuration/Administrative Templates/Desktop/Desktop/Desktop Wallpaper

#>


<# 

Convert GPO to DSC
https://docs.microsoft.com/en-us/powershell/dsc/quickstarts/gpo-quickstart?view=dsc-1.1

#>