<#
.Synopsis
   Downloads GitHub repo master archive to current or specified path
.DESCRIPTION
   url is root of Repo eg https://github.com/lukemgriffith/pythonDjango-Blog
.EXAMPLE
    # Downloads to current location.
    PS hps:\lab> Download-GitHubRepo https://github.com/Veil-Framework/Veil-Evasion   
.EXAMPLE
   PS hps:\lab> Download-GitHubRepo https://github.com/lukemgriffith/pythonDjango-Blog
                
.INPUTS
   URL - Root URL of Repo eg https://github.com/lukemgriffith/Posh-DevOps
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function Download-GitHubRepo {



    param ( 
    $url,
    $path = ($pwd | select -ExpandProperty ProviderPath)
   
    )
    # Downloading Files
    # https://teusje.wordpress.com/2011/02/19/download-file-with-powershell/
        $webclient = New-Object System.Net.WebClient
    $url = "$url/archive/master.zip"
    $file = "$path\$($url.split("/")[-3]).zip"
    $webclient.DownloadFile($url,$file)
    get-item -Path $file

}

<#
.Synopsis
   Unpacks ZipFile to current or specified path
.DESCRIPTION
   Long description
.EXAMPLE
   Unpack-ZipFile .\Veil-Evasion.zip 
.EXAMPLE
   Unpack-ZipFile .\Veil-Evasion.zip -destination $home
.INPUTS
   Path - Path of Zip File
   Destination - target for unzip
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function Unpack-ZipFile {

    <# 
    
    #>
    
    param(
    $path,
    $destination = (Get-Location | select -ExpandProperty ProviderPath)
    )

    $path = Get-Item $path | select -ExpandProperty fullname
    
    # http://blogs.technet.com/b/heyscriptingguy/archive/2015/03/11/use-powershell-to-extract-zipped-files.aspx
    Add-Type -assembly "system.io.compression.filesystem"
    [io.compression.zipfile]::ExtractToDirectory($path, $destination)


}



