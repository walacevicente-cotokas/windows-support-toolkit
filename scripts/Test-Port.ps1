param(
    [Parameter(Mandatory = $true)]
    [string]$ComputerName,

    [Parameter(Mandatory = $true)]
    [ValidateRange(1, 65535)]
    [int]$Port
)

$result = Test-NetConnection -ComputerName $ComputerName -Port $Port -WarningAction SilentlyContinue

[PSCustomObject]@{
    ComputerName = $ComputerName
    RemoteAddress = $result.RemoteAddress
    Port          = $Port
    TcpTestSucceeded = $result.TcpTestSucceeded
}
