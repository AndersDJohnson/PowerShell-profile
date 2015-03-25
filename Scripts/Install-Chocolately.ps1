<#
 http://chocolatey.org/
#>

. ($here + "\Scripts\WebClientProxied.ps1") -force

$wc = New-WebClientProxied
$url = "https://chocolatey.org/install.ps1"
$str = $wc.DownloadString($url)
$str | Invoke-Expression
