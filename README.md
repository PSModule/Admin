# Admin

Admin is a PowerShell module for checking whether the current session is running in an elevated context — as an administrator on Windows, or as root on Linux and macOS.

## Installation

Install the module from the PowerShell Gallery:

```powershell
Install-PSResource -Name Admin
Import-Module -Name Admin
```

## Usage

### Example: Test if the current context is elevated

```powershell
Test-Admin
# True
```

`Test-Admin` returns `$true` when the current session is running with administrator (Windows) or root (Linux/macOS) privileges, otherwise `$false`. Use it to gate operations that require elevation:

```powershell
if (-not (Test-Admin)) {
    throw 'This operation requires an elevated session.'
}
```

## Documentation

Documentation is published at [psmodule.io/Admin](https://psmodule.io/Admin/).

Use PowerShell help and command discovery for module details:

```powershell
Get-Command -Module Admin
Get-Help Test-Admin -Examples
```
