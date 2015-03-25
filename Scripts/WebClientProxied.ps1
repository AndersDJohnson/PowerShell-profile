<#
 http://waynes-world-it.blogspot.com/2008/05/reading-web-content-with-powershell.html
 http://stackoverflow.com/questions/14263359/access-web-using-powershell-and-proxy
#>

function New-WebClientProxied {

    #$proxyAddr = (get-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings').ProxyServer
    #$proxy = new-object System.Net.WebProxy
    #$proxy.Address = $proxyAddr
    #$proxy.useDefaultCredentials = $true

    #$username = $env:username
    #$userdomain = $env:userdomain
    #$proxyAddr = (get-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings').ProxyServer
    #echo "proxy address: " $proxyAddr
    #echo "username: " $username
    #echo "userdomain: " $userdomain
    #$pwd = Read-Host "Password?" -assecurestring
    #
    #$proxy = new-object System.Net.WebProxy
    #$proxy.Address = $proxyAddr
    #$account = new-object System.Net.NetworkCredential(
    #    $username,
    #    [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pwd)),
    #    $userdomain
    #)
    #$proxy.credentials = $account

    echo $account
    echo $proxy

    $wc = New-Object system.net.WebClient

    #$wc.proxy = $proxy

    $wc.Proxy = [System.Net.WebRequest]::DefaultWebProxy
    $wc.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

    #$webpage = $wc.DownloadData($url)
    #$str = [System.Text.Encoding]::ASCII.GetString($webpage)

    return $wc
}
