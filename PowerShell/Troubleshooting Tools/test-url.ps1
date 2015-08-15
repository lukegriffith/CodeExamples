function test-url ([string[]]$url) {
    
    while ($true) {
        $url | foreach {

	
	        $date = get-date
            Invoke-WebRequest -Uri $_ | select StatusCode,  @{n='url';e={$url}}, @{n='time';e={get-date}},  @{name='Response';expression={(New-TimeSpan -Start $date -End (get-date)).TotalSeconds}}, @{name='ip';expression={[system.net.dns]::resolve($_.url).addresslist.ipaddresstostring}}
        }
        Start-Sleep -Seconds 5
    }

}
