##### WMI HotFix Report #####
## Required Resources - TRM03
## Steps: Amend variables below
## Purpose: Executes script on remote host that has module libraries to access CI password database.
## Author: Luke Griffith

# Enter CI's here 
$ci = "server1", "server2"
# Desination for CSV Report 
 $path = "$home\Documents\HotFixReport.csv"
# ID of hotfixes 
 $hotfixID = "KB2631813", "KBXXXX"


# No need to edit further down
# -----------------------------


<#
.Synopsis
   Function goes off to TRM03 and executes reporting scripts. Requires manual input for TRM03 password.
#>
function Get-HotFixReport {
param([string[]]$ci,[string]$wmi = "win32_quickfixengineering")

    # Defining script block to execute on remote host.
    $sb = { 
        param($ci,$wmi)
            . C:\Users\mmc_support\Documents\Scripts\wmi.ps1
            get-ciwmi -ci $ci -wmiClass $wmi
    }

    # Creating new PowerShell session asking for manual input for password. 
    $pss =New-PSSession -ComputerName att10trm03 -Credential (Get-Credential -UserName "att10trm03\mmc_support" -Message "Enter password for mmc_support user on TRM03")

    # Invoked command on remote host, passing in requested CI's and WMI class.
    Invoke-Command -Session $pss -ScriptBlock $sb -ArgumentList $ci, $wmi | select CSName, HotFixID, InstallDate, InstalledBy, Description

}


# Executes the function to get hotfix report
$hotfix = Get-HotFixReport -ci $ci

# Processes output and selects hotfixID's specified. Remove the where clause if you dont want filtering - will then export a CSV file to your defined path
$hotfix | Where-Object {$_.hotfixid -in $hotfixID} | Export-Csv -Path $path

# checks to ensure no servers have failed 
$notprocessed = Compare-Object -ReferenceObject $ci -DifferenceObject ($hotfix | Group-Object CSName | select -ExpandProperty name) | Where-Object {$_.SideIndicator -eq "<="} | select-Object -ExpandProperty InputObject

# if servers have failed, will print server names
if ($notprocessed) {write-host -ForegroundColor red -Object "Not Processd $notprocessed"}