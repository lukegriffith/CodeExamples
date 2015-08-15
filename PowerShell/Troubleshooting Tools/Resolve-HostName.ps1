function resolve-hostname
{ 
    param(
            [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true)]
        $hostname
    )

    process {

    foreach ($host in $hostname)
    {
        [system.net.dns]::Resolve($host) 
    }

    }
}
