$internetSettingsPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings'
$userProxy = Get-ItemProperty -Path $internetSettingsPath -ErrorAction SilentlyContinue

$winHttpOutput = netsh winhttp show proxy | Out-String

[PSCustomObject]@{
    UserProxyEnabled = [bool]$userProxy.ProxyEnable
    UserProxyServer  = $userProxy.ProxyServer
    AutoConfigURL    = $userProxy.AutoConfigURL
    AutoDetect       = $userProxy.AutoDetect
    WinHTTPProxy     = $winHttpOutput.Trim()
}
