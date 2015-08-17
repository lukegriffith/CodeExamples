param ($servers)

<#
Script was in response to an automated need required by SAP analysts for post-patch work. 
Checks needed to be done on Patch and Kernel number where previously this was run manually.
I created a script that would complete the task over PS-Remoting and using PowerShells built in Regex match function

#>

$sb = {
$output =  & 'C:\Program Files\SAP\hostctrl\exe\saphostexec.exe' '-version'
$obj = "" | select Server, Patch, Kernel
$patch = $output | foreach { if ($_ -match "patch number.*[^\r\n]") { $_ } } 
$kernel = $output | foreach { if ($_ -match "kernel release.*[0-9*]") { $_ } } 
$obj.server = (hostname)
$obj.Patch = $patch.split(" ")[-1]
$obj.Kernel =  $kernel.split(" ")[-1]
$obj
}


# Note: gpass is an alias accessing a module that utilizes a CI password store API
$servers | foreach { New-PSSession -ComputerName $_ -Credential (gpass $_) } 
$output = Invoke-Command -Session (Get-PSSession) -ScriptBlock $sb