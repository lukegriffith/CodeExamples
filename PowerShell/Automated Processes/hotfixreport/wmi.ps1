# Script is executed by remote sessions

function get-ciwmi {
param([string[]]$ci,[string]$wmiClass)

ipmo pspasswordproxyws
$ws = New-PasswordProxyWS

$servers = $ci | foreach { 

$obj = "" | select server, credential 
$obj.credential = Get-ManageCredential -PasswordProxyWS $ws -CI <redact>
$obj.server = $_ 

$obj

}

$servers | foreach { Get-WmiObject -Class $wmiClass -ComputerName $_.server -Credential $_.credential | select * } 

}

