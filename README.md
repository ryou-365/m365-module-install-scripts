# m365-module-install-scripts

The PowerShell script automates the installation, update checking, error handling, and version display of Microsoft 365 management modules such as Microsoft Graph, Exchange Online, SharePoint Online, and Teams.

## Overview

This repository provides a set of PowerShell scripts designed to simplify the management of Microsoft 365 by automating the installation and updating process of various management modules. The scripts offer the following features:

- **Automated Installation:** Installs required Microsoft 365 management modules.
- **Update Checking:** Verifies if a newer version of a module is available and performs an update if necessary.
- **Error Handling:** Implements try/catch blocks to manage errors gracefully.
- **Version Display:** Shows the currently installed version of each module.

## Supported Modules

The following modules are supported by the scripts:

- Microsoft Graph (for Azure AD, Intune, Teams, etc.)
- Exchange Online Management
- SharePoint Online & OneDrive Management
- Microsoft Teams Management
- Defender for Office 365 Management
- Windows Autopilot/Intune (Device Management)
- Power Platform modules such as PowerApps, Power Automate, and Dataverse
- Yammer Administration

## Usage

### Running a Single Script
To run an individual installation script, open PowerShell (ensure you're using PowerShell 5.x) and execute the desired script. For example:

```powershell
.\Scripts\Install-MicrosoftGraph.ps1
```

### Interactive Menu
Alternatively, an interactive menu is provided. When executed, the script will display a list of available modules. You can select one or more modules by entering the corresponding numbers (or "A" for all). This mode automates the installation, update, and version-check process.

### Batch Execution
To execute all installation scripts at once, run the following command from the repository root:

```powershell
$scriptPath = ".\Scripts"
Get-ChildItem -Path $scriptPath -Filter "Install-*.ps1" | ForEach-Object { 
    Write-Host "Executing: $($_.Name)" -ForegroundColor Cyan
    & "$scriptPath\$($_.Name)"
}
```

## Contribution
Contributions and improvements to the scripts are welcome! If you find an issue or have a suggestion, please open an issue or submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
