# ===============================================================
# Microsoft 365 Management Modules Installation Menu
# Each module includes error handling, installation checking,
# update checking, and version display.
# ===============================================================

# ----- Function Definitions -----

function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO"
    )
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    Write-Host "$timestamp [$Level] $Message"
}

function Install-ModuleWithUpdateCheck {
    param(
        [string]$moduleName
    )
    Write-Host "----------------------------------------------" -ForegroundColor Cyan
    Write-Host "Checking installation for [$moduleName]..." -ForegroundColor Cyan

    # Check for NuGet provider
    if (-not (Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue)) {
        Write-Host "Installing NuGet provider..." -ForegroundColor Yellow
        Try {
            Install-PackageProvider -Name NuGet -Scope CurrentUser -Force -Confirm:$false -ErrorAction Stop
            Write-Log "Successfully installed the NuGet provider."
        }
        Catch {
            Write-Log "Failed to install the NuGet provider: $_" "ERROR"
            return
        }
    }

    # Check if the module is already installed
    $installedModule = Get-Module -Name $moduleName -ListAvailable | Select-Object -First 1
    if ($installedModule) {
        Write-Host "[$moduleName] is already installed - Version: $($installedModule.Version)" -ForegroundColor Green

        # Check for the latest version
        Try {
            $latestModule = Find-Module -Name $moduleName -ErrorAction Stop
            $latestVersion = $latestModule.Version
        }
        Catch {
            Write-Log "Failed to check for the latest version of [$moduleName]: $_" "ERROR"
            return
        }

        if ($installedModule.Version -lt $latestVersion) {
            Write-Host "A newer version ($latestVersion) of [$moduleName] is available. Updating..." -ForegroundColor Yellow
            Try {
                Update-Module -Name $moduleName -Scope CurrentUser -Force -ErrorAction Stop
                Write-Host "Update of [$moduleName] completed successfully." -ForegroundColor Green
            }
            Catch {
                Write-Host "Update of [$moduleName] failed: $_" -ForegroundColor Red
            }
        }
        else {
            Write-Host "[$moduleName] is up-to-date." -ForegroundColor Green
        }
    }
    else {
        # If the module is not installed, install it
        Write-Host "Installing [$moduleName]..." -ForegroundColor Yellow
        Try {
            if ($moduleName -eq "Microsoft.Entra") {
                Install-Module -Name $moduleName -Scope CurrentUser -Force -AllowClobber -ErrorAction Stop
            }
            else {
                Install-Module -Name $moduleName -Scope CurrentUser -Force -ErrorAction Stop
            }
            Write-Host "Installation of [$moduleName] completed successfully." -ForegroundColor Green
        }
        Catch {
            Write-Host "Installation of [$moduleName] failed: $_" -ForegroundColor Red
        }
    }
    Write-Host "----------------------------------------------`n" -ForegroundColor Cyan
}

# ----- Define the Module List -----
$modules = @(
    @{ Name = "Microsoft.Graph";                              Description = "Microsoft Graph API (Azure AD, Intune, Teams, etc.)" },
    @{ Name = "Microsoft.Entra";                              Description = "Microsoft Entra Management" },
    @{ Name = "EntraExporter";                                Description = "Microsoft Entra Exporter" },
    @{ Name = "ExchangeOnlineManagement";                     Description = "Exchange Online Management" },
    @{ Name = "Microsoft.Online.SharePoint.PowerShell";       Description = "SharePoint Online & OneDrive Management" },
    @{ Name = "PnP.PowerShell";                               Description = "PnP PowerShell (SharePoint, Teams, and M365)" },
    @{ Name = "MicrosoftTeams";                               Description = "Microsoft Teams Management" },
    @{ Name = "WindowsAutoPilotIntune";                       Description = "Windows Autopilot/Intune (Device Management)" },
    @{ Name = "Microsoft.PowerApps.Administration.PowerShell"; Description = "PowerApps Administration" },
    @{ Name = "Microsoft.PowerApps.PowerShell";              Description = "PowerApps Module" }
)

# ----- Display the Menu -----
Write-Host "================ Microsoft 365 Management Modules Installation Menu ================" -ForegroundColor Magenta
for ($i = 0; $i -lt $modules.Count; $i++) {
    Write-Host "[$($i+1)] $($modules[$i].Name) - $($modules[$i].Description)"
}
Write-Host "[A] Execute All Modules"
Write-Host "======================================================================================="

# ----- Get User Input -----
$inputChoice = Read-Host "Select the module number(s) to install (or type 'A' for all). For multiple selections, separate by commas."

# ----- Process the Selection -----
if ($inputChoice -match "^(?i:a)$") {
    # Execute all modules
    foreach ($mod in $modules) {
        Install-ModuleWithUpdateCheck -moduleName $mod.Name
    }
}
else {
    # Process as a comma-separated list of numbers
    $selections = $inputChoice -split ",\s*"
    foreach ($sel in $selections) {
        $parsedIndex = 0
        if ([int]::TryParse($sel, [ref]$parsedIndex)) {
            $index = $parsedIndex - 1
            if ($index -ge 0 -and $index -lt $modules.Count) {
                $modName = $modules[$index].Name
                Install-ModuleWithUpdateCheck -moduleName $modName
            }
            else {
                Write-Host "Number $sel is invalid." -ForegroundColor Red
            }
        }
        else {
            Write-Host "Input '$sel' is invalid. Please specify a number or 'A'." -ForegroundColor Red
        }
    }
}

Write-Host "`nModule installation process completed." -ForegroundColor Magenta
