:: ----------------------------------------------------------
:: --------Microsoft Retail Demo experience (revert)---------
:: ----------------------------------------------------------
echo --- Microsoft Retail Demo experience (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'RetailDemo'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Downloaded Maps Manager (revert)-------------
:: ----------------------------------------------------------
echo --- Downloaded Maps Manager (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'MapsBroker'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Program Compatibility Assistant Service (revert)-----
:: ----------------------------------------------------------
echo --- Program Compatibility Assistant Service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'PcaSvc'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Delivery Optimization (P2P Windows Updates) (revert)---
:: ----------------------------------------------------------
echo --- Delivery Optimization (P2P Windows Updates) (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'DoSvc'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Xbox Live Auth Manager (revert)--------------
:: ----------------------------------------------------------
echo --- Xbox Live Auth Manager (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'XblAuthManager'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Xbox Live Game Save (revert)---------------
:: ----------------------------------------------------------
echo --- Xbox Live Game Save (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'XblGameSave'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Xbox Live Networking Service (revert)-----------
:: ----------------------------------------------------------
echo --- Xbox Live Networking Service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'XboxNetApiSvc'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Turn off "Look For An App In The Store" option (revert)--
:: ----------------------------------------------------------
echo --- Turn off "Look For An App In The Store" option (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable Live Tiles push notifications (revert)------
:: ----------------------------------------------------------
echo --- Disable Live Tiles push notifications (revert)
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoTileApplicationNotification" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable lock screen app notifications (revert)------
:: ----------------------------------------------------------
echo --- Disable lock screen app notifications (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLockScreenAppNotifications" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: Disable connected user experiences and telemetry service (revert)
echo --- Disable connected user experiences and telemetry service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'DiagTrack'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable WAP push message routing service (revert)-----
:: ----------------------------------------------------------
echo --- Disable WAP push message routing service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'dmwappushservice'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable devicecensus.exe (telemetry) task (revert)----
:: ----------------------------------------------------------
echo --- Disable devicecensus.exe (telemetry) task (revert)
schtasks /change /TN "Microsoft\Windows\Device Information\Device" /enable
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable devicecensus.exe (telemetry) process (revert)---
:: ----------------------------------------------------------
echo --- Disable devicecensus.exe (telemetry) process (revert)
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\'DeviceCensus.exe'" /v "Debugger" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable Microsoft Compatibility Appraiser task (revert)--
:: ----------------------------------------------------------
echo --- Disable Microsoft Compatibility Appraiser task (revert)
schtasks /change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /enable
:: ----------------------------------------------------------


:: Disable CompatTelRunner.exe (Microsoft Compatibility Appraiser) process (revert)
echo --- Disable CompatTelRunner.exe (Microsoft Compatibility Appraiser) process (revert)
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\'CompatTelRunner.exe'" /v "Debugger" /f
:: ----------------------------------------------------------


:: Disable sending information to Customer Experience Improvement Program (revert)
echo --- Disable sending information to Customer Experience Improvement Program (revert)
schtasks /change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /enable
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable Application Impact Telemetry Agent task (revert)-
:: ----------------------------------------------------------
echo --- Disable Application Impact Telemetry Agent task (revert)
schtasks /change /TN "Microsoft\Windows\Application Experience\AitAgent" /enable
:: ----------------------------------------------------------


:: Disable Customer Experience Improvement (CEIP/SQM) (revert)
echo --- Disable Customer Experience Improvement (CEIP/SQM) (revert)
reg add "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "1" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Disable Application Impact Telemetry (AIT) (revert)----
:: ----------------------------------------------------------
echo --- Disable Application Impact Telemetry (AIT) (revert)
reg add "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "1" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable Customer Experience Improvement Program (revert)-
:: ----------------------------------------------------------
echo --- Disable Customer Experience Improvement Program (revert)
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /ENABLE
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /ENABLE
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /ENABLE
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable error reporting (revert)-------------
:: ----------------------------------------------------------
echo --- Disable error reporting (revert)
:: Enable Windows Error Reporting (WER)
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /f
:: DefaultConsent / 1 - Always ask (default) / 2 - Parameters only / 3 - Parameters and safe data / 4 - All data
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultConsent" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultOverrideBehavior" /t REG_DWORD /d "0" /f
:: Enable WER sending second-level data
reg delete "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /f
:: Enable WER crash dialogs, popups
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "0" /f
schtasks /Change /TN "Microsoft\Windows\ErrorDetails\EnableErrorDetailsUpdate" /Enable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Enable
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'wersvc'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'wercplsupport'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Deny app access to Document folder (revert)--------
:: ----------------------------------------------------------
echo --- Deny app access to Document folder (revert)
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /d "Allow" /t REG_SZ /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Deny app access to Pictures folder (revert)--------
:: ----------------------------------------------------------
echo --- Deny app access to Pictures folder (revert)
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /d "Allow" /t REG_SZ /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Deny app access to Videos folder (revert)---------
:: ----------------------------------------------------------
echo --- Deny app access to Videos folder (revert)
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /d "Allow" /t REG_SZ /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Deny app access to other filesystem (revert)-------
:: ----------------------------------------------------------
echo --- Deny app access to other filesystem (revert)
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /d "Allow" /t REG_SZ /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable apps and Cortana to activate with voice (revert)-
:: ----------------------------------------------------------
echo --- Disable apps and Cortana to activate with voice (revert)
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationEnabled" /t REG_DWORD /d 1 /f
:: Using GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" /f
:: ----------------------------------------------------------


:: Disable apps and Cortana to activate with voice when sytem is locked (revert)
echo --- Disable apps and Cortana to activate with voice when sytem is locked (revert)
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationOnLockScreenEnabled" /t REG_DWORD /d 1 /f
:: Using GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoiceAboveLock" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Deny app access to location (revert)-----------
:: ----------------------------------------------------------
echo --- Deny app access to location (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /d "Allow" /f
:: For older Windows (before 1903)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /d "1" /t REG_DWORD /f
:: Using GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessLocation" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessLocation_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessLocation_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessLocation_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: Deny app access to account info, name, and picture (revert)
echo --- Deny app access to account info, name, and picture (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /d "Allow" /f
:: For older Windows (before 1903)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /t REG_SZ /v "Value" /d "Allow" /f
:: GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessAccountInfo" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessAccountInfo_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessAccountInfo_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessAccountInfo_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Deny app access to motion data (revert)----------
:: ----------------------------------------------------------
echo --- Deny app access to motion data (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /d "Allow" /f
:: GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMotion" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMotion_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMotion_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMotion_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Deny app access to phone (revert)-------------
:: ----------------------------------------------------------
echo --- Deny app access to phone (revert)
:: GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessPhone" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessPhone_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessPhone_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessPhone_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Deny app access to trusted devices (revert)--------
:: ----------------------------------------------------------
echo --- Deny app access to trusted devices (revert)
:: For older Windows (before 1903)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /t REG_SZ /v "Value" /d "Allow" /f
:: GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessTrustedDevices" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessTrustedDevices_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessTrustedDevices_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessTrustedDevices_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: Deny app sync with devices (unpaired, beacons, TVs, etc.) (revert)
echo --- Deny app sync with devices (unpaired, beacons, TVs, etc.) (revert)
:: GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsSyncWithDevices" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsSyncWithDevices_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsSyncWithDevices_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsSyncWithDevices_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: Deny app access to diagnostics info about your other apps (revert)
echo --- Deny app access to diagnostics info about your other apps (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /d "Allow" /t REG_SZ /f
:: GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsGetDiagnosticInfo" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsGetDiagnosticInfo_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsGetDiagnosticInfo_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsGetDiagnosticInfo_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Deny app access to your contacts (revert)---------
:: ----------------------------------------------------------
echo --- Deny app access to your contacts (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /d "Allow" /t REG_SZ /f
:: For older Windows (before 1903)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /t REG_SZ /v "Value" /d "Allow" /f
:: GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessContacts" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessContacts_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessContacts_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessContacts_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Deny app access to Notifications (revert)---------
:: ----------------------------------------------------------
echo --- Deny app access to Notifications (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /d "Allow" /t REG_SZ /f
:: For older Windows (before 1903)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /t REG_SZ /v "Value" /d "Allow" /f
:: Using GPO (re-activation through GUI is not possible)
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessNotifications" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessNotifications_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessNotifications_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessNotifications_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Deny app access to Calendar (revert)-----------
:: ----------------------------------------------------------
echo --- Deny app access to Calendar (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /d "Allow" /t REG_SZ /f
:: For older Windows (before 1903)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /t REG_SZ /v "Value" /d "Allow" /f
:: Using GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCalendar" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCalendar_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCalendar_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCalendar_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Deny app access to call history (revert)---------
:: ----------------------------------------------------------
echo --- Deny app access to call history (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /d "Allow" /t REG_SZ /f
:: For older Windows (before 1903)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{8BC668CF-7728-45BD-93F8-CF2B3B41D7AB}" /t REG_SZ /v "Value" /d "Allow" /f
:: Using GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCallHistory" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCallHistory_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCallHistory_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCallHistory_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Deny app access to email (revert)-------------
:: ----------------------------------------------------------
echo --- Deny app access to email (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /d "Allow" /t REG_SZ /f
:: For older Windows (before 1903)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /t REG_SZ /v "Value" /d "Allow" /f
:: Using GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessEmail" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessEmail_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessEmail_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessEmail_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Deny app access to tasks (revert)-------------
:: ----------------------------------------------------------
echo --- Deny app access to tasks (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /d "Allow" /t REG_SZ /f
:: Using GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessTasks" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessTasks_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessTasks_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessTasks_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Deny app access to messaging (SMS / MMS) (revert)-----
:: ----------------------------------------------------------
echo --- Deny app access to messaging (SMS / MMS) (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /d "Allow" /t REG_SZ /f
:: For older Windows (before 1903)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /t REG_SZ /v "Value" /d "Allow" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{21157C1F-2651-4CC1-90CA-1F28B02263F6}" /t REG_SZ /v "Value" /d "Allow" /f
:: Using GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMessaging" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMessaging_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMessaging_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMessaging_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Deny app access to radios (revert)------------
:: ----------------------------------------------------------
echo --- Deny app access to radios (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /d "Allow" /t REG_SZ /f
:: For older Windows (before 1903)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /t REG_SZ /v "Value" /d "Allow" /f
:: Using GPO
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessRadios" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessRadios_UserInControlOfTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessRadios_ForceAllowTheseApps" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessRadios_ForceDenyTheseApps" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Deny app access to bluetooth devices (revert)-------
:: ----------------------------------------------------------
echo --- Deny app access to bluetooth devices (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /d "Allow" /t REG_SZ /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Turn off location scripting (revert)-----------
:: ----------------------------------------------------------
echo --- Turn off location scripting (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d "0" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Turn off location (revert)----------------
:: ----------------------------------------------------------
echo --- Turn off location (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /d "0" /t REG_DWORD /f
:: For older Windows (before 1903)
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /d "1" /t REG_DWORD /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "Value" /t REG_SZ /d "Allow" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Do not allow Cortana (revert)---------------
:: ----------------------------------------------------------
echo --- Do not allow Cortana (revert)
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Do not allow Cortana experience (revert)---------
:: ----------------------------------------------------------
echo --- Do not allow Cortana experience (revert)
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: Do not allow search and Cortana to search cloud sources like OneDrive and SharePoint (revert)
echo --- Do not allow search and Cortana to search cloud sources like OneDrive and SharePoint (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: Disable Cortana speech interaction while the system is locked (revert)
echo --- Disable Cortana speech interaction while the system is locked (revert)
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Opt out from Cortana consent (revert)-----------
:: ----------------------------------------------------------
echo --- Opt out from Cortana consent (revert)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d 10 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Do not allow Cortana to be enabled (revert)--------
:: ----------------------------------------------------------
echo --- Do not allow Cortana to be enabled (revert)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: Disable Cortana (Internet search results in start menu) (revert)
echo --- Disable Cortana (Internet search results in start menu) (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 1 /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Remove the Cortana taskbar icon (revert)---------
:: ----------------------------------------------------------
echo --- Remove the Cortana taskbar icon (revert)
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "ShowCortanaButton" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Cortana in ambient mode (revert)---------
:: ----------------------------------------------------------
echo --- Disable Cortana in ambient mode (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaInAmbientMode" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Prevent Cortana from displaying history (revert)-----
:: ----------------------------------------------------------
echo --- Prevent Cortana from displaying history (revert)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "HistoryViewEnabled" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Prevent Cortana from using device history (revert)----
:: ----------------------------------------------------------
echo --- Prevent Cortana from using device history (revert)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable "Hey Cortana" voice activation (revert)------
:: ----------------------------------------------------------
echo --- Disable "Hey Cortana" voice activation (revert)
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationOn" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationDefaultOn" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: Disable Cortana listening to commands on Windows key + C (revert)
echo --- Disable Cortana listening to commands on Windows key + C (revert)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "VoiceShortcut" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: Disable using Cortana even when device is locked (revert)-
:: ----------------------------------------------------------
echo --- Disable using Cortana even when device is locked (revert)
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationEnableAboveLockscreen" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable automatic update of Speech Data (revert)-----
:: ----------------------------------------------------------
echo --- Disable automatic update of Speech Data (revert)
reg delete "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /f
:: ----------------------------------------------------------


:: Disable Cortana voice support during Windows setup (revert)
echo --- Disable Cortana voice support during Windows setup (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "DisableVoice" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: Disable search indexing encrypted items / stores (revert)-
:: ----------------------------------------------------------
echo --- Disable search indexing encrypted items / stores (revert)
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingEncryptedStoresOrItems" /f
:: ----------------------------------------------------------


:: Do not use automatic language detection when indexing (revert)
echo --- Do not use automatic language detection when indexing (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AlwaysUseAutoLangDetection" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Do not allow search to use location (revert)-------
:: ----------------------------------------------------------
echo --- Do not allow search to use location (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable web search in search bar (revert)---------
:: ----------------------------------------------------------
echo --- Disable web search in search bar (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable Bing search (revert)---------------
:: ----------------------------------------------------------
echo --- Disable Bing search (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable ad customization with Advertising ID (revert)---
:: ----------------------------------------------------------
echo --- Disable ad customization with Advertising ID (revert)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "0" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Turn Off Suggested Content in Settings app (revert)----
:: ----------------------------------------------------------
echo --- Turn Off Suggested Content in Settings app (revert)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /d "1" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /d "1" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /d "1" /t REG_DWORD /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Windows Tips (revert)---------------
:: ----------------------------------------------------------
echo --- Disable Windows Tips (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d "0" /f
:: ----------------------------------------------------------


:: Disable Windows Spotlight (random wallpaper on lock screen) (revert)
echo --- Disable Windows Spotlight (random wallpaper on lock screen) (revert)
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t "REG_DWORD" /d "0" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable Microsoft consumer experiences (revert)------
:: ----------------------------------------------------------
echo --- Disable Microsoft consumer experiences (revert)
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t "REG_DWORD" /d "0" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Windows Insider Service (revert)---------
:: ----------------------------------------------------------
echo --- Disable Windows Insider Service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'wisvc'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Do not let Microsoft try features on this build (revert)-
:: ----------------------------------------------------------
echo --- Do not let Microsoft try features on this build (revert)
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableExperimentation" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /f
reg delete "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "value" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable getting preview builds of Windows (revert)----
:: ----------------------------------------------------------
echo --- Disable getting preview builds of Windows (revert)
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable cloud speech recognition (revert)---------
:: ----------------------------------------------------------
echo --- Disable cloud speech recognition (revert)
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t "REG_DWORD" /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Opt out from Windows privacy consent (revert)-------
:: ----------------------------------------------------------
echo --- Opt out from Windows privacy consent (revert)
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Turn off sensors (revert)-----------------
:: ----------------------------------------------------------
echo --- Turn off sensors (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t REG_DWORD /d "0" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable Inventory Collector (revert)-----------
:: ----------------------------------------------------------
echo --- Disable Inventory Collector (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable Website Access of Language List (revert)-----
:: ----------------------------------------------------------
echo --- Disable Website Access of Language List (revert)
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable online tips (revert)---------------
:: ----------------------------------------------------------
echo --- Disable online tips (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Turn off Internet File Association service (revert)----
:: ----------------------------------------------------------
echo --- Turn off Internet File Association service (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Turn off the "Order Prints" picture task (revert)-----
:: ----------------------------------------------------------
echo --- Turn off the "Order Prints" picture task (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoOnlinePrintsWizard" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: Disable the file and folder Publish to Web option (revert)
echo --- Disable the file and folder Publish to Web option (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: Prevent downloading a list of providers for wizards (revert)
echo --- Prevent downloading a list of providers for wizards (revert)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWebServices" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------