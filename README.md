# m365-module-install-scripts

Microsoft 365 管理モジュールのインストールと更新を自動化する PowerShell スクリプト集です。管理者がすぐに運用を始められるよう、初期セットアップを簡単にすることを目的としています。

## 概要

このリポジトリには、Microsoft 365 管理用モジュールのインストールや更新を自動化する PowerShell スクリプトが含まれています。主な機能は次のとおりです。

- **インストールの自動化**: 必要な Microsoft 365 管理モジュールを自動でインストールします。
- **更新チェック**: 新しいバージョンがある場合は自動的に更新を実行します。
- **エラーハンドリング**: try/catch を用いた安定したエラー処理を行います。
- **バージョン表示**: 各モジュールのインストール済みバージョンを表示します。

## 対応モジュール

次のモジュールをインストールおよび更新できます。

- **Microsoft Graph**: Azure AD、Intune、Teams などを管理するためのモジュール
- **Microsoft Entra**: Microsoft Entra 全体の管理を提供
- **EntraExporter**: Microsoft Entra のデータエクスポート
- **Exchange Online Management**: Exchange Online の管理用モジュール
- **SharePoint Online & OneDrive Management**: Microsoft.Online.SharePoint.PowerShell を利用した管理
- **Microsoft Teams Management**: Microsoft Teams 管理用ツール
- **Windows Autopilot/Intune (Device Management)**: WindowsAutoPilotIntune を通じたデバイス管理
- **Power Platform Modules**: Microsoft.PowerApps.Administration.PowerShell と Microsoft.PowerApps.PowerShell

## 使い方

### クイックスタート

1. 本リポジトリをクローンまたはダウンロードします。
2. PowerShell 5.x 以降を起動します。
3. `scripts` ディレクトリに移動します。
4. `./m365-module-install-menu.ps1` を実行します。
5. インストールしたいモジュール番号を入力します。すべて導入する場合は `A` を指定します。

### 個別スクリプトの実行

特定のモジュールだけをインストールしたい場合は、PowerShell (5.x 以降) を開き、対象のスクリプトを実行します。例:

```powershell
.\scripts\m365-module-install-menu.ps1
```

### インタラクティブメニュー

スクリプトを実行するとメニューが表示され、インストールしたいモジュール番号 (または全選択の `A`) を入力できます。インストール・更新・バージョン確認が自動で行われます。

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

## リポジトリ構造

- `README.md` と `LICENSE` がリポジトリのルートにあります。
- 主要な PowerShell スクリプトは `scripts/m365-module-install-menu.ps1` です。

## 重要事項

- スクリプトは PowerShell 5.x 以降での実行を想定しています。
- 実行ポリシーによりスクリプトがブロックされる場合は `Set-ExecutionPolicy` コマンドで許可してください。
- 初回実行時に NuGet プロバイダーを自動インストールします。

## 次に学ぶべきこと

- `$modules` 配列に独自モジュールを追加する方法
- Microsoft 365 管理作業を自動化するための PowerShell の基本操作

## 貢献

バグ報告や機能追加の提案は歓迎します。Issue または Pull Request を利用してください。

## ライセンス

本プロジェクトは MIT License の下で公開されています。詳細は LICENSE ファイルを参照してください。
