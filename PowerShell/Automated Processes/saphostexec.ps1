$servers = "server1"



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

$servers | foreach { New-PSSession -ComputerName $_ -Credential (gpass $_) } 
$output = Invoke-Command -Session (Get-PSSession) -ScriptBlock $sb