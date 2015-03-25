<#
 http://psget.net/
#>

. ($here + "\Scripts\WebClientProxied.ps1") -force

$wc = New-WebClientProxied
$url = "http://psget.net/GetPsGet.ps1"
$str = $wc.DownloadString($url)
$str | Invoke-Expression
