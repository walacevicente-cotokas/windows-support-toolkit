$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$systemDrive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$($os.SystemDrive)'"

$uptime = (Get-Date) - $os.LastBootUpTime
$memoryUsedPercent = [math]::Round((($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize) * 100, 2)
$driveFreePercent = if ($systemDrive.Size -gt 0) {
    [math]::Round(($systemDrive.FreeSpace / $systemDrive.Size) * 100, 2)
} else {
    0
}

[PSCustomObject]@{
    ComputerName     = $env:COMPUTERNAME
    OperatingSystem = $os.Caption
    OSVersion       = $os.Version
    Uptime          = ('{0} days, {1} hours' -f [math]::Floor($uptime.TotalDays), $uptime.Hours)
    CPULoadPercent  = $cpu.LoadPercentage
    MemoryUsedPct   = $memoryUsedPercent
    SystemDrive     = $os.SystemDrive
    DriveFreePct    = $driveFreePercent
}
