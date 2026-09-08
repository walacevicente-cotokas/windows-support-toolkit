$defaultRoute = Get-NetRoute -DestinationPrefix '0.0.0.0/0' -ErrorAction SilentlyContinue |
    Sort-Object RouteMetric |
    Select-Object -First 1

$gateway = $defaultRoute.NextHop

$gatewayReachable = if ($gateway) {
    Test-Connection -ComputerName $gateway -Count 1 -Quiet -ErrorAction SilentlyContinue
} else {
    $false
}

$dnsTarget = 'github.com'
$dnsResolved = $false
$resolvedAddress = $null

try {
    $dnsResult = Resolve-DnsName -Name $dnsTarget -Type A -ErrorAction Stop | Select-Object -First 1
    $dnsResolved = $true
    $resolvedAddress = $dnsResult.IPAddress
} catch {
    $dnsResolved = $false
}

$internetReachable = Test-NetConnection -ComputerName '1.1.1.1' -Port 443 -InformationLevel Quiet -WarningAction SilentlyContinue

[PSCustomObject]@{
    Gateway            = $gateway
    GatewayReachable   = $gatewayReachable
    DNSQuery            = $dnsTarget
    DNSResolved         = $dnsResolved
    ResolvedAddress     = $resolvedAddress
    InternetHTTPS       = $internetReachable
}
