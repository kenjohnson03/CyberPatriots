
# Change your prompt 
function prompt { $l = Get-Location; "$l`nPS > " }

# Make a directory in the working path you are currently in
mkdir ".\MOFs" -Force

######################################################################
#                                                                    #
#                          Reference Pages                           #
#                                                                    #
######################################################################

# Getting Started
Start-Process "https://docs.microsoft.com/en-us/powershell/dsc/overview"
Start-Process "https://docs.microsoft.com/en-us/powershell/dsc/resources"

# Writing Resources
Start-Process "https://docs.microsoft.com/en-us/powershell/dsc/authoringresourceclass"
Start-Process "https://docs.microsoft.com/en-us/powershell/dsc/singleinstance"

######################################################################
#                                                                    #
#              Get and set registry items individually               #
#                                                                    #
######################################################################

New-Item -Path "HKLM:\Software\Testing"

New-ItemProperty -Path "HKLM:\Software\Testing" -Name "Configuration" -value 1

Get-Item -Path "HKLM:\Software\Testing"

Get-ItemProperty -Path "HKLM:\Software\Testing" -Name "Configuration"

Remove-Item -Path "HKLM:\Software\Testing"

######################################################################
#                                                                    #
#               Use a configuration for the same item                #
#                                                                    #
######################################################################

Configuration MyRegistryCheck
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'

    Registry 'Testing'
	{
	 	ValueName = 'Configuration'
	 	ValueType = 'Dword'
	 	Key = 'HKLM:\Software\Testing'
	 	ValueData = 1

	}
}

MyRegistryCheck -OutputPath ".\MOFs"

ise .\MOFs\localhost.mof

Test-DscConfiguration -ReferenceConfiguration .\MOFs\localhost.mof

######################################################################
#                                                                    #
#             Use DSCEA to analyze a machine or multiple             #
#                                                                    #
######################################################################

Install-Module dscea

Get-Command -Module dscea

Start-DSCeascan -MofFile .\MOFs\localhost.mof -ComputerName localhost

Get-DSCEAreport -Overall

.\OverallComplianceReport.html


# Apply settings with DSC

Start-DscConfiguration -Path .\MOFs -ComputerName localhost -Wait -Verbose -Force


# Audit Policy Dsc
# https://www.powershellgallery.com/packages/AuditPolicyDsc/1.4.0.0
# https://github.com/dsccommunity/AuditPolicyDsc/blob/master/Examples/Sample_AuditPolicyGuid.ps1

# Security Policy Dsc
# https://www.powershellgallery.com/packages/SecurityPolicyDsc/3.0.0-preview0006
# https://github.com/dsccommunity/SecurityPolicyDsc
# 

Install-Module securitypolicydsc

Save-Module securitypolicydsc -Path 'C:\Program Files\WindowsPowerShell\Modules'

Get-DscResource -module  securitypolicydsc

configuration secPolConf
{
    Import-DscResource -ModuleName SecurityPolicyDsc -Name UserRightsAssignment
    UserRightsAssignment 'CreateAPagefile'
    {
        Identity = @('BUILTIN\Administrators')
        Policy = 'Create_a_pagefile'
    }
}