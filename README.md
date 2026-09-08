# Windows Support Toolkit

A practical PowerShell toolkit for **Windows troubleshooting, diagnostics and IT support automation**.

This project is built around common enterprise support scenarios such as checking network connectivity, validating ports, reviewing proxy settings, inspecting Windows services and collecting system information for faster troubleshooting.

## 🎯 Goals

- Reduce repetitive troubleshooting steps
- Standardize first-level diagnostics
- Produce reusable PowerShell tools for support teams
- Document real-world Windows troubleshooting scenarios
- Build a practical portfolio around IT infrastructure and automation

## 🧰 Current Tools

| Script | Purpose |
|---|---|
| `Get-SystemHealth.ps1` | Collects core system health information |
| `Test-Network.ps1` | Tests DNS, gateway and internet connectivity |
| `Test-Port.ps1` | Tests TCP connectivity to a remote host and port |
| `Get-ProxyConfig.ps1` | Reviews WinHTTP and user proxy settings |
| `Get-ServiceStatus.ps1` | Checks the state of selected Windows services |

## 📁 Project Structure

```text
windows-support-toolkit/
├── scripts/
│   ├── Get-SystemHealth.ps1
│   ├── Test-Network.ps1
│   ├── Test-Port.ps1
│   ├── Get-ProxyConfig.ps1
│   └── Get-ServiceStatus.ps1
├── docs/
│   └── troubleshooting-guide.md
└── README.md
```

## 🚀 Example

```powershell
.\scripts\Get-SystemHealth.ps1
```

Example output:

```text
Computer Name : WS-001
Operating System: Microsoft Windows 11 Pro
Uptime         : 4 days, 7 hours
CPU Load       : 18%
Memory Used    : 63%
System Drive   : 41% free
```

## 🔐 Security

This repository does not contain production credentials, internal company information, customer names, private IP addresses or other sensitive data.

All examples are generic and intended for learning, troubleshooting and portfolio demonstration.

## 🛣️ Roadmap

- [x] System health check
- [x] Network diagnostics
- [x] TCP port testing
- [x] Proxy inspection
- [x] Windows service checks
- [ ] Printer diagnostics
- [ ] Event Viewer analysis
- [ ] Consolidated support report
- [ ] Export results to JSON/CSV

## 👤 Author

**Walace Vicente**

IT Infrastructure and Support professional focused on Windows environments, troubleshooting, PowerShell automation, APIs and data-driven operations.
