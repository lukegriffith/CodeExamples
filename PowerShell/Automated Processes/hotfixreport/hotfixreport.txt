##### WMI HotFix Report #####
## Required Resources - ATT10TRM03
## Steps: Amend variables below
## Author: Luke Griffith

# Enter CI's here 
$ci = "riv10dbs21", "riv10dbs22"
# Desination for CSV Report 
 $path = "$home\Documents\HotFixReport.csv"
# ID of hotfixes 
 $hotfixID = "KB2631813", "KBXXXX"


# No need to edit further down
# -----------------------------


<#
.Synopsis
   Function goes off to ATT10TRM03 and executes reporting scripts. Requires manual input for att10trm03 password
#>
function Get-HotFixReport {
param([string[]]$ci,[string]$wmi = "win32_quickfixengineering")

    $sb = { 
        param($ci,$wmi)
            . C:\Users\mmc_support\Documents\Scripts\wmi.ps1
            get-ciwmi -ci $ci -wmiClass $wmi
    }

    $pss =New-PSSession -ComputerName att10trm03 -Credential (Get-Credential -UserName "att10trm03\mmc_support" -Message "Enter password for mmc_support user on ATT10TRM03")

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