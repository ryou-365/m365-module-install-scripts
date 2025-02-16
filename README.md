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

- **Microsoft Graph:** Provides management capabilities for Azure AD, Intune, Teams, and more.
- **Microsoft Entra:** Offers overall management for Microsoft Entra, impacting the entire Microsoft 365 environment.
- **EntraExporter:** Enables data export for Microsoft Entra.
- **Exchange Online Management:** Handles administration tasks for Exchange Online.
- **SharePoint Online & OneDrive Management:** Utilizes the Microsoft.Online.SharePoint.PowerShell module for managing SharePoint Online and OneDrive.
- **Microsoft Teams Management:** Provides tools for managing Microsoft Teams.
- **Windows Autopilot/Intune (Device Management):** Supports device provisioning and management via WindowsAutoPilotIntune.
- **Power Platform Modules:** Includes both Microsoft.PowerApps.Administration.PowerShell and Microsoft.PowerApps.PowerShell for managing PowerApps within the Power Platform.

## Usage

### Running a Single Script
To run an individual installation script, open PowerShell (ensure you're using PowerShell 5.x) and execute the desired script. For example:

```powershell
.\scripts\m365-module-install-menu.ps1
```

### Interactive Menu
Alternatively, an interactive menu is provided. When executed, the script will display a list of available modules. You can select one or more modules by entering the corresponding numbers (or "A" for all). This mode automates the installation, update, and version-check process.

```powershell
PS C:\Users\ryou-365>.\scripts\m365-module-install-menu.ps1
================ Microsoft 365 Management Modules Installation Menu ================
[1] Microsoft.Graph - Microsoft Graph API (Azure AD, Intune, Teams, etc.)
[2] Microsoft.Entra - Microsoft Entra Management
[3] EntraExporter - Microsoft Entra Exporter
[4] ExchangeOnlineManagement - Exchange Online Management
[5] Microsoft.Online.SharePoint.PowerShell - SharePoint Online & OneDrive Management
[6] MicrosoftTeams - Microsoft Teams Management
[7] WindowsAutoPilotIntune - Windows Autopilot/Intune (Device Management)
[8] Microsoft.PowerApps.Administration.PowerShell - PowerApps Administration
[9] Microsoft.PowerApps.PowerShell - PowerApps Module
[A] Execute All Modules
=======================================================================================
Select the module number(s) to install (or type 'A' for all). For multiple selections, separate by commas.: 1,2,3,7
----------------------------------------------
Checking installation for [Microsoft.Graph]...
[Microsoft.Graph] is already installed - Version: 2.25.0
[Microsoft.Graph] is up-to-date.
----------------------------------------------

----------------------------------------------
Checking installation for [Microsoft.Entra]...
Installing [Microsoft.Entra]...
Installation of [Microsoft.Entra] completed successfully.
----------------------------------------------

----------------------------------------------
Checking installation for [EntraExporter]...
[EntraExporter] is already installed - Version: 2.0.7
[EntraExporter] is up-to-date.
----------------------------------------------

----------------------------------------------
Checking installation for [WindowsAutoPilotIntune]...
[WindowsAutoPilotIntune] is already installed - Version: 5.7
[WindowsAutoPilotIntune] is up-to-date.
----------------------------------------------


Module installation process completed.
PS C:\Users\ryou-365>
```

## Contribution
Contributions and improvements to the scripts are welcome! If you find an issue or have a suggestion, please open an issue or submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
