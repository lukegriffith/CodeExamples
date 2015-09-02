<#
Author: Luke Griffith
Created: 17/03/2015
Purpose: Generates a log and emails SAP analyst directory list of S:\usr\sap\Interfaces\feeders\data\inbound\fidelio, including filecount and timestamp
#>


# Generating LogName variables
$LogTime = Get-Date -Format "MM-dd-yyyy___hh-mm-ss"
$LogFile = 'D:\Attenda\fidelioaudit\'+"fidelio_filelist"+$LogTime+".log"

# Storing child items from directory
$GCIoutput =  Get-ChildItem -path S:\usr\sap\Interfaces\feeders\data\inbound\fidelio 

# Collecting array of item names from Child Items
$List = foreach ($item in $GCIoutput) {$item.name}

# Collecting count
$GCIcount = $GCIoutput | measure | select -ExpandProperty Count

# Declaring Body variable as an array
$Body = @()

# Adding Date, and FileCount to Body
$Body += "Date: $(Get-Date)
File Count: $($GCIcount)

"

# Adding names of files to Body
$Body += foreach ($item in $GCIoutput) {"$($item.name)"}

# Sending message via Attenda SMTP server to SAP analyst
Send-MailMessage -to "<analyst@attenda.com>" -From "<support@attenda.com>" -Subject "Fidelio List" -Body "$($Body)" -SmtpServer <# Redacted #>

# Outputting Log File
$Body | Out-File $LogFile
