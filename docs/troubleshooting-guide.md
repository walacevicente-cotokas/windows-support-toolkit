# Windows Troubleshooting Guide

This guide documents a simple first-response workflow for common Windows support incidents.

## 1. System Health

Run:

```powershell
.\scripts\Get-SystemHealth.ps1
```

Check operating system, uptime, CPU load, memory usage and free space on the system drive.

## 2. Network

Run:

```powershell
.\scripts\Test-Network.ps1
```

Validate the default gateway, DNS resolution and outbound HTTPS connectivity.

## 3. TCP Port

Run:

```powershell
.\scripts\Test-Port.ps1 -ComputerName server.example.local -Port 443
```

Use this to confirm whether a TCP service is reachable from the workstation or server being diagnosed.

## 4. Proxy

Run:

```powershell
.\scripts\Get-ProxyConfig.ps1
```

Review both user-level Windows Internet Settings and the WinHTTP proxy configuration.

## 5. Windows Services

Run:

```powershell
.\scripts\Get-ServiceStatus.ps1
```

Or specify custom services:

```powershell
.\scripts\Get-ServiceStatus.ps1 -ServiceName Spooler,BITS,W32Time
```

## Suggested Troubleshooting Flow

1. Confirm the issue and scope.
2. Check system health.
3. Validate network and DNS.
4. Check required ports.
5. Review proxy settings.
6. Verify dependent Windows services.
7. Review logs and application-specific errors.
8. Document the root cause and resolution.

> The examples in this repository use generic hosts and do not contain production data.
