param(
    [string[]]$ServiceName = @('Spooler','W32Time','BITS')
)

foreach ($name in $ServiceName) {
    $service = Get-Service -Name $name -ErrorAction SilentlyContinue

    if ($null -eq $service) {
        [PSCustomObject]@{
            ServiceName = $name
            DisplayName = $null
            Status      = 'NotFound'
            StartType   = $null
        }
        continue
    }

    $serviceInfo = Get-CimInstance Win32_Service -Filter "Name='$($service.Name)'" -ErrorAction SilentlyContinue

    [PSCustomObject]@{
        ServiceName = $service.Name
        DisplayName = $service.DisplayName
        Status      = $service.Status
        StartType   = $serviceInfo.StartMode
    }
}
