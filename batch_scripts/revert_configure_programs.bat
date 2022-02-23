:: ----------------------------------------------------------
:: ---------Disable visual studio telemetry (revert)---------
:: ----------------------------------------------------------
echo --- Disable visual studio telemetry (revert)
reg add "HKCU\Software\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Visual Studio feedback (revert)----------
:: ----------------------------------------------------------
echo --- Disable Visual Studio feedback (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableFeedbackDialog" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableEmailInput" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableScreenshotCapture" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: Stop and disable Visual Studio Standard Collector Service (revert)
echo --- Stop and disable Visual Studio Standard Collector Service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'VSStandardCollectorService150'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable SQM OS key (revert)----------------
:: ----------------------------------------------------------
echo --- Disable SQM OS key (revert)
if %PROCESSOR_ARCHITECTURE%==x86 ( REM is 32 bit?
    reg add "HKLM\SOFTWARE\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
    reg add "HKLM\SOFTWARE\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
    reg add "HKLM\SOFTWARE\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
) else (
    reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
    reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
    reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
)
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable SQM group policy (revert)-------------
:: ----------------------------------------------------------
echo --- Disable SQM group policy (revert)
reg add "HKLM\Software\Policies\Microsoft\VisualStudio\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable Visual Studio Code telemetry (revert)-------
:: ----------------------------------------------------------
echo --- Disable Visual Studio Code telemetry (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('telemetry.enableTelemetry'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Disable Visual Studio Code crash reporting (revert)----
:: ----------------------------------------------------------
echo --- Disable Visual Studio Code crash reporting (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('telemetry.enableCrashReporter'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Do not run Microsoft online experiments (revert)-----
:: ----------------------------------------------------------
echo --- Do not run Microsoft online experiments (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('workbench.enableExperiments'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Microsoft Office logging (revert)---------
:: ----------------------------------------------------------
echo --- Disable Microsoft Office logging (revert)
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable client telemetry (revert)-------------
:: ----------------------------------------------------------
echo --- Disable client telemetry (revert)
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Customer Experience Improvement Program (revert)-----
:: ----------------------------------------------------------
echo --- Customer Experience Improvement Program (revert)
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable feedback (revert)-----------------
:: ----------------------------------------------------------
echo --- Disable feedback (revert)
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable telemetry agent (revert)-------------
:: ----------------------------------------------------------
echo --- Disable telemetry agent (revert)
schtasks /change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /ENABLE
schtasks /change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack2016" /ENABLE
schtasks /change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /ENABLE
schtasks /change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn2016" /ENABLE
:: ----------------------------------------------------------


:: Disable Windows Media Player Network Sharing Service (revert)
echo --- Disable Windows Media Player Network Sharing Service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'WMPNetworkSvc'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Opt out from NVIDIA telemetry (revert)----------
:: ----------------------------------------------------------
echo --- Opt out from NVIDIA telemetry (revert)
reg delete "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /f 
reg delete "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /f 
reg delete "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /f 
reg delete "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /f 
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\services\NvTelemetryContainer" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable NVIDIA telemetry services (revert)--------
:: ----------------------------------------------------------
echo --- Disable NVIDIA telemetry services (revert)
schtasks /change /TN NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /ENABLE
schtasks /change /TN NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /ENABLE
schtasks /change /TN NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /ENABLE
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable NET Core CLI telemetry (revert)----------
:: ----------------------------------------------------------
echo --- Disable NET Core CLI telemetry (revert)
setx DOTNET_CLI_TELEMETRY_OPTOUT 0
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable PowerShell 7+ telemetry (revert)---------
:: ----------------------------------------------------------
echo --- Disable PowerShell 7+ telemetry (revert)
setx POWERSHELL_TELEMETRY_OPTOUT 0
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Google update service (revert)----------
:: ----------------------------------------------------------
echo --- Disable Google update service (revert)
schtasks /Change /enable /tn "GoogleUpdateTaskMachineCore"
schtasks /change /enable /tn "GoogleUpdateTaskMachineUA"
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'gupdate'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'gupdatem'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable Adobe Acrobat update service (revert)-------
:: ----------------------------------------------------------
echo --- Disable Adobe Acrobat update service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'AdobeARMservice'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'adobeupdateservice'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'adobeflashplayerupdatesvc'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
schtasks /change /tn "Adobe Acrobat Update Task" /enable
schtasks /change /tn "Adobe Flash Player Updater" /enable
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Razer Game Scanner Service (revert)--------
:: ----------------------------------------------------------
echo --- Disable Razer Game Scanner Service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'Razer Game Scanner Service'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable Logitech Gaming Registry Service (revert)-----
:: ----------------------------------------------------------
echo --- Disable Logitech Gaming Registry Service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'LogiRegistryService'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Dropbox auto update service (revert)-------
:: ----------------------------------------------------------
echo --- Disable Dropbox auto update service (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'dbupdate'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'dbupdatem'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
schtasks /Change /ENABLE /TN "DropboxUpdateTaskMachineCore"
schtasks /Change /ENABLE /TN "DropboxUpdateTaskMachineUA"
:: ----------------------------------------------------------


:: Disable Edge usage and crash-related data reporting (shows "Your browser is managed") (revert)
echo --- Disable Edge usage and crash-related data reporting (shows "Your browser is managed") (revert)
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "MetricsReportingEnabled" /f
:: ----------------------------------------------------------


:: Disable sending site information (shows "Your browser is managed") (revert)
echo --- Disable sending site information (shows "Your browser is managed") (revert)
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SendSiteInfoToImproveServices" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable live tile data collection (revert)--------
:: ----------------------------------------------------------
echo --- Disable live tile data collection (revert)
reg add "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "PreventLiveTileDataCollection" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable MFU tracking (revert)---------------
:: ----------------------------------------------------------
echo --- Disable MFU tracking (revert)
reg add "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" /v "DisableMFUTracking" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable recent apps (revert)---------------
:: ----------------------------------------------------------
echo --- Disable recent apps (revert)
reg add "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" /v "DisableRecentApps" /t REG_DWORD /d 0/f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Turn off backtracking (revert)--------------
:: ----------------------------------------------------------
echo --- Turn off backtracking (revert)
reg add "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" /v "TurnOffBackstack" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Search Suggestions in Edge (revert)--------
:: ----------------------------------------------------------
echo --- Disable Search Suggestions in Edge (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes" /v "ShowSearchSuggestionsGlobal" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable Geolocation in Internet Explorer (revert)-----
:: ----------------------------------------------------------
echo --- Disable Geolocation in Internet Explorer (revert)
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Geolocation" /v "PolicyDisableGeolocation" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Disable Internet Explorer InPrivate logging (revert)---
:: ----------------------------------------------------------
echo --- Disable Internet Explorer InPrivate logging (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" /v "DisableLogging" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Internet Explorer CEIP (revert)----------
:: ----------------------------------------------------------
echo --- Disable Internet Explorer CEIP (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /v "DisableCustomerImprovementProgram" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable calling legacy WCM policies (revert)-------
:: ----------------------------------------------------------
echo --- Disable calling legacy WCM policies (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CallLegacyWCMPolicies" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable SSLv3 fallback (revert)--------------
:: ----------------------------------------------------------
echo --- Disable SSLv3 fallback (revert)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v EnableSSL3Fallback /t REG_DWORD /d 3 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable ignoring cert errors (revert)-----------
:: ----------------------------------------------------------
echo --- Disable ignoring cert errors (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "PreventIgnoreCertErrors" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable Chrome Software Reporter Tool (revert)------
:: ----------------------------------------------------------
echo --- Disable Chrome Software Reporter Tool (revert)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "1" /f
:: ----------------------------------------------------------


:: Disable Chrome metrics reporting (shows "Your browser is managed") (revert)
echo --- Disable Chrome metrics reporting (shows "Your browser is managed") (revert)
reg delete "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /f
:: ----------------------------------------------------------


:: Do not share scanned software data to Google (shows "Your browser is managed") (revert)
echo --- Do not share scanned software data to Google (shows "Your browser is managed") (revert)
reg delete "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupReportingEnabled" /f
:: ----------------------------------------------------------


:: Prevent Chrome from scanning the system for cleanup (shows "Your browser is managed") (revert)
echo --- Prevent Chrome from scanning the system for cleanup (shows "Your browser is managed") (revert)
reg delete "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupEnabled" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Firefox metrics reporting (revert)--------
:: ----------------------------------------------------------
echo --- Disable Firefox metrics reporting (revert)
reg add HKLM\SOFTWARE\Policies\Mozilla\Firefox /v DisableTelemetry /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable default browser agent reporting policy (revert)--
:: ----------------------------------------------------------
echo --- Disable default browser agent reporting policy (revert)
reg add HKLM\SOFTWARE\Policies\Mozilla\Firefox /v DisableDefaultBrowserAgent /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: Disable default browser agent reporting services (revert)-
:: ----------------------------------------------------------
echo --- Disable default browser agent reporting services (revert)
schtasks.exe /change /enable /tn "\Mozilla\Firefox Default Browser Agent 308046B0AF4A39CB"
schtasks.exe /change /enable /tn "\Mozilla\Firefox Default Browser Agent D2CEEC440E2074BD"
:: ----------------------------------------------------------