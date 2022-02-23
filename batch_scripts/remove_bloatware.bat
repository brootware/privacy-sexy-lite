:: ----------------------------------------------------------
:: ------------Delete controversial default0 user------------
:: ----------------------------------------------------------
echo --- Delete controversial default0 user
net user defaultuser0 /delete 2>nul
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Enable Reset Base in Dism Component Store---------
:: ----------------------------------------------------------
echo --- Enable Reset Base in Dism Component Store
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\SideBySide\Configuration" /v "DisableResetbase" /t "REG_DWORD" /d "0" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Remove Default Apps Associations-------------
:: ----------------------------------------------------------
echo --- Remove Default Apps Associations
dism /online /Remove-DefaultAppAssociations
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Clear (Reset) Network Data Usage-------------
:: ----------------------------------------------------------
echo --- Clear (Reset) Network Data Usage
setlocal EnableDelayedExpansion 
    SET /A dps_service_running=0
    SC queryex "DPS"|Find "STATE"|Find /v "RUNNING">Nul||(
        SET /A dps_service_running=1
        net stop DPS
    )
    del /F /S /Q /A "%windir%\System32\sru*"
    IF !dps_service_running! == 1 (
        net start DPS
    )
endlocal
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------------Clear Flash traces--------------------
:: ----------------------------------------------------------
echo --- Clear Flash traces
rd /s /q "%APPDATA%\Macromedia\Flash Player"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Clear Steam dumps, logs, and traces------------
:: ----------------------------------------------------------
echo --- Clear Steam dumps, logs, and traces
del /f /q %ProgramFiles(x86)%\Steam\Dumps
del /f /q %ProgramFiles(x86)%\Steam\Traces
del /f /q %ProgramFiles(x86)%\Steam\appcache\*.log
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Clear Visual Studio telemetry and feedback data------
:: ----------------------------------------------------------
echo --- Clear Visual Studio telemetry and feedback data
rmdir /s /q "%AppData%\vstelemetry" 2>nul
rmdir /s /q "%LocalAppData%\Microsoft\VSApplicationInsights" 2>nul
rmdir /s /q "%ProgramData%\Microsoft\VSApplicationInsights" 2>nul
rmdir /s /q "%Temp%\Microsoft\VSApplicationInsights" 2>nul
rmdir /s /q "%Temp%\VSFaultInfo" 2>nul
rmdir /s /q "%Temp%\VSFeedbackPerfWatsonData" 2>nul
rmdir /s /q "%Temp%\VSFeedbackVSRTCLogs" 2>nul
rmdir /s /q "%Temp%\VSRemoteControl" 2>nul
rmdir /s /q "%Temp%\VSTelem" 2>nul
rmdir /s /q "%Temp%\VSTelem.Out" 2>nul
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Clear Dotnet CLI telemetry----------------
:: ----------------------------------------------------------
echo --- Clear Dotnet CLI telemetry
rmdir /s /q "%USERPROFILE%\.dotnet\TelemetryStorageService" 2>nul
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Clear Windows temp files-----------------
:: ----------------------------------------------------------
echo --- Clear Windows temp files
del /f /q %localappdata%\Temp\*
rd /s /q "%WINDIR%\Temp"
rd /s /q "%TEMP%"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Clear main telemetry file-----------------
:: ----------------------------------------------------------
echo --- Clear main telemetry file
if exist "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl" (
    takeown /f "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl" /r /d y
    icacls "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl" /grant administrators:F /t
    echo "" > "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl"
    echo Clear successful: "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl"
) else (
    echo "Main telemetry file does not exist. Good!"
)
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Clear regedit last key------------------
:: ----------------------------------------------------------
echo --- Clear regedit last key
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Clear regedit favorites------------------
:: ----------------------------------------------------------
echo --- Clear regedit favorites
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Clear list of recent programs opened-----------
:: ----------------------------------------------------------
echo --- Clear list of recent programs opened
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Clear Adobe Media Browser MRU---------------
:: ----------------------------------------------------------
echo --- Clear Adobe Media Browser MRU
reg delete "HKCU\Software\Adobe\MediaBrowser\MRU" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------------Clear MSPaint MRU---------------------
:: ----------------------------------------------------------
echo --- Clear MSPaint MRU
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------------Clear Wordpad MRU---------------------
:: ----------------------------------------------------------
echo --- Clear Wordpad MRU
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Clear Map Network Drive MRU MRU--------------
:: ----------------------------------------------------------
echo --- Clear Map Network Drive MRU MRU
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Clear Windows Search Assistant history----------
:: ----------------------------------------------------------
echo --- Clear Windows Search Assistant history
reg delete "HKCU\Software\Microsoft\Search Assistant\ACMru" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Clear list of Recent Files Opened, by Filetype------
:: ----------------------------------------------------------
echo --- Clear list of Recent Files Opened, by Filetype
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Clear windows media player recent files and URLs-----
:: ----------------------------------------------------------
echo --- Clear windows media player recent files and URLs
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentFileList" /va /f
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentURLList" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\MediaPlayer\Player\RecentFileList" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\MediaPlayer\Player\RecentURLList" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Clear Most Recent Application's Use of DirectX------
:: ----------------------------------------------------------
echo --- Clear Most Recent Application's Use of DirectX
reg delete "HKCU\Software\Microsoft\Direct3D\MostRecentApplication" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\MostRecentApplication" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Clear Windows Run MRU & typedpaths------------
:: ----------------------------------------------------------
echo --- Clear Windows Run MRU ^& typedpaths
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /va /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Clear recently accessed files---------------
:: ----------------------------------------------------------
echo --- Clear recently accessed files
del /f /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Clear Internet Explorer caches--------------
:: ----------------------------------------------------------
echo --- Clear Internet Explorer caches
del /f /q "%localappdata%\Microsoft\Windows\INetCache\IE\*"
rd /s /q "%localappdata%\Microsoft\Windows\WebCache"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Clear Temporary Internet Files (browser cache)------
:: ----------------------------------------------------------
echo --- Clear Temporary Internet Files (browser cache)
:: Windows XP
rd /s /q %userprofile%\Local Settings\Temporary Internet Files
:: Windows 7
rd /s /q "%localappdata%\Microsoft\Windows\Temporary Internet Files"
takeown /f "%localappdata%\Temporary Internet Files" /r /d y
icacls "%localappdata%\Temporary Internet Files" /grant administrators:F /t
rd /s /q "%localappdata%\Temporary Internet Files"
:: Windows 8 and above
rd /s /q "%localappdata%\Microsoft\Windows\INetCache"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Clear Internet Explorer Feeds Cache------------
:: ----------------------------------------------------------
echo --- Clear Internet Explorer Feeds Cache
rd /s /q "%localappdata%\Microsoft\Feeds Cache"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Clear Internet Explorer DOMStore-------------
:: ----------------------------------------------------------
echo --- Clear Internet Explorer DOMStore
rd /s /q "%localappdata%\Microsoft\InternetExplorer\DOMStore"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Clear Google Chrome crash reports-------------
:: ----------------------------------------------------------
echo --- Clear Google Chrome crash reports
rd /s /q "%localappdata%\Google\Chrome\User Data\Crashpad\reports\"
rd /s /q "%localappdata%\Google\CrashReports\"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Clear Software Reporter Tool logs-------------
:: ----------------------------------------------------------
echo --- Clear Software Reporter Tool logs
del /f /q "%localappdata%\Google\Software Reporter Tool\*.log"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Clear browsing history and caches-------------
:: ----------------------------------------------------------
echo --- Clear browsing history and caches
set ignoreFiles="content-prefs.sqlite" "permissions.sqlite" "favicons.sqlite"
for %%d in ("%APPDATA%\Mozilla\Firefox\Profiles\"
            "%USERPROFILE%\Local Settings\Application Data\Mozilla\Firefox\Profiles\"
        ) do (
    IF EXIST %%d (
        FOR /d %%p IN (%%d*) DO (
            for /f "delims=" %%f in ('dir /b /s "%%p\*.sqlite" 2^>nul') do (
                set "continue="
                for %%i in (%ignoreFiles%) do ( 
                    if %%i == "%%~nxf" (
                        set continue=1
                    )
                )
                if not defined continue (
                    del /q /s /f %%f
                )
            )
        )
    )
)
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Clear Webpage Icons--------------------
:: ----------------------------------------------------------
echo --- Clear Webpage Icons
:: Windows XP
del /q /s /f "%USERPROFILE%\Local Settings\Application Data\Safari\WebpageIcons.db"
:: Windows Vista and later
del /q /s /f "%localappdata%\Apple Computer\Safari\WebpageIcons.db"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------------Clear Safari cache--------------------
:: ----------------------------------------------------------
echo --- Clear Safari cache
:: Windows XP
del /q /s /f "%USERPROFILE%\Local Settings\Application Data\Apple Computer\Safari\Cache.db"
:: Windows Vista and later
del /q /s /f "%localappdata%\Apple Computer\Safari\Cache.db"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: Clear Optional Component Manager and COM+ components logs-
:: ----------------------------------------------------------
echo --- Clear Optional Component Manager and COM+ components logs
del /f /q %SystemRoot%\comsetup.log
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Clear Distributed Transaction Coordinator logs------
:: ----------------------------------------------------------
echo --- Clear Distributed Transaction Coordinator logs
del /f /q %SystemRoot%\DtcInstall.log
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Clear Windows Deployment Upgrade Process Logs-------
:: ----------------------------------------------------------
echo --- Clear Windows Deployment Upgrade Process Logs
del /f /q %SystemRoot%\setupact.log
del /f /q %SystemRoot%\setuperr.log
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Clear Windows Setup Logs-----------------
:: ----------------------------------------------------------
echo --- Clear Windows Setup Logs
del /f /q %SystemRoot%\setupapi.log
del /f /q %SystemRoot%\Panther\*
del /f /q %SystemRoot%\inf\setupapi.app.log
del /f /q %SystemRoot%\inf\setupapi.dev.log
del /f /q %SystemRoot%\inf\setupapi.offline.log
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Clear Windows System Assessment Tool logs---------
:: ----------------------------------------------------------
echo --- Clear Windows System Assessment Tool logs
del /f /q %SystemRoot%\Performance\WinSAT\winsat.log
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Clear Password change events---------------
:: ----------------------------------------------------------
echo --- Clear Password change events
del /f /q %SystemRoot%\debug\PASSWD.LOG
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Clear user web cache database---------------
:: ----------------------------------------------------------
echo --- Clear user web cache database
del /f /q %localappdata%\Microsoft\Windows\WebCache\*.*
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Clear system temp folder when no one is logged in-----
:: ----------------------------------------------------------
echo --- Clear system temp folder when no one is logged in
del /f /q %SystemRoot%\ServiceProfiles\LocalService\AppData\Local\Temp\*.*
:: ----------------------------------------------------------


:: Clear DISM (Deployment Image Servicing and Management) Logs
echo --- Clear DISM (Deployment Image Servicing and Management) Logs
del /f /q  %SystemRoot%\Logs\CBS\CBS.log
del /f /q  %SystemRoot%\Logs\DISM\DISM.log
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Common Language Runtime Logs---------------
:: ----------------------------------------------------------
echo --- Common Language Runtime Logs
del /f /q "%LocalAppData%\Microsoft\CLR_v4.0\UsageTraces\*"
del /f /q "%LocalAppData%\Microsoft\CLR_v4.0_32\UsageTraces\*"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Network Setup Service Events Logs-------------
:: ----------------------------------------------------------
echo --- Network Setup Service Events Logs
del /f /q "%SystemRoot%\Logs\NetSetup\*"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Clear Windows update and SFC scan logs----------
:: ----------------------------------------------------------
echo --- Clear Windows update and SFC scan logs
del /f /q %SystemRoot%\Temp\CBS\*
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Clear Windows Update Medic Service logs----------
:: ----------------------------------------------------------
echo --- Clear Windows Update Medic Service logs
takeown /f %SystemRoot%\Logs\waasmedic /r /d y
icacls %SystemRoot%\Logs\waasmedic /grant administrators:F /t
rd /s /q %SystemRoot%\Logs\waasmedic
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Clear Cryptographic Services Traces------------
:: ----------------------------------------------------------
echo --- Clear Cryptographic Services Traces
del /f /q %SystemRoot%\System32\catroot2\dberr.txt
del /f /q %SystemRoot%\System32\catroot2.log
del /f /q %SystemRoot%\System32\catroot2.jrs
del /f /q %SystemRoot%\System32\catroot2.edb
del /f /q %SystemRoot%\System32\catroot2.chk
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Uninstall Cortana app-------------------
:: ----------------------------------------------------------
echo --- Uninstall Cortana app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.549981C3F5F10' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------------Feedback Hub app---------------------
:: ----------------------------------------------------------
echo --- Feedback Hub app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsFeedbackHub' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------------Windows Maps app---------------------
:: ----------------------------------------------------------
echo --- Windows Maps app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsMaps' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Microsoft Advertising app-----------------
:: ----------------------------------------------------------
echo --- Microsoft Advertising app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Advertising.Xaml' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Network Speed Test app------------------
:: ----------------------------------------------------------
echo --- Network Speed Test app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.NetworkSpeedTest' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------------MSN Weather app----------------------
:: ----------------------------------------------------------
echo --- MSN Weather app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingWeather' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------------MSN Sports app----------------------
:: ----------------------------------------------------------
echo --- MSN Sports app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingSports' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------------MSN News app-----------------------
:: ----------------------------------------------------------
echo --- MSN News app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingNews' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------------MSN Money app-----------------------
:: ----------------------------------------------------------
echo --- MSN Money app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingFinance' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------------My Office app-----------------------
:: ----------------------------------------------------------
echo --- My Office app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MicrosoftOfficeHub' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Xbox Console Companion app----------------
:: ----------------------------------------------------------
echo --- Xbox Console Companion app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxApp' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Xbox Live in-game experience app-------------
:: ----------------------------------------------------------
echo --- Xbox Live in-game experience app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Xbox.TCUI' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------------Xbox Game Bar app---------------------
:: ----------------------------------------------------------
echo --- Xbox Game Bar app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxGamingOverlay' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Xbox Game Bar Plugin appcache---------------
:: ----------------------------------------------------------
echo --- Xbox Game Bar Plugin appcache
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxGameOverlay' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Xbox Identity Provider app----------------
:: ----------------------------------------------------------
echo --- Xbox Identity Provider app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxIdentityProvider' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Xbox Speech To Text Overlay app--------------
:: ----------------------------------------------------------
echo --- Xbox Speech To Text Overlay app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxSpeechToTextOverlay' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Holographic First Run app-----------------
:: ----------------------------------------------------------
echo --- Holographic First Run app
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.Windows.Holographic.FirstRun'; if (!$package) {; Write-Host 'Not installed'; exit 0; }; $directories = @($package.InstallLocation, "^""$env:LOCALAPPDATA\Packages\$($package.PackageFamilyName)"^""); foreach($dir in $directories) {; if ( !$dir -Or !(Test-Path "^""$dir"^"") ) { continue }; cmd /c ('takeown /f "^""' + $dir + '"^"" /r /d y 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; cmd /c ('icacls "^""' + $dir + '"^"" /grant administrators:F /t 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; $files = Get-ChildItem -File -Path $dir -Recurse -Force; foreach($file in $files) {; if($file.Name.EndsWith('.OLD')) { continue }; $newName =  $file.FullName + '.OLD'; Write-Host "^""Rename '$($file.FullName)' to '$newName'"^""; Move-Item -LiteralPath "^""$($file.FullName)"^"" -Destination "^""$newName"^"" -Force; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Windows 10 Family Safety / Parental Controls app-----
:: ----------------------------------------------------------
echo --- Windows 10 Family Safety / Parental Controls app
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.Windows.ParentalControls'; if (!$package) {; Write-Host 'Not installed'; exit 0; }; $directories = @($package.InstallLocation, "^""$env:LOCALAPPDATA\Packages\$($package.PackageFamilyName)"^""); foreach($dir in $directories) {; if ( !$dir -Or !(Test-Path "^""$dir"^"") ) { continue }; cmd /c ('takeown /f "^""' + $dir + '"^"" /r /d y 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; cmd /c ('icacls "^""' + $dir + '"^"" /grant administrators:F /t 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; $files = Get-ChildItem -File -Path $dir -Recurse -Force; foreach($file in $files) {; if($file.Name.EndsWith('.OLD')) { continue }; $newName =  $file.FullName + '.OLD'; Write-Host "^""Rename '$($file.FullName)' to '$newName'"^""; Move-Item -LiteralPath "^""$($file.FullName)"^"" -Destination "^""$newName"^"" -Force; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Windows Feedback app-------------------
:: ----------------------------------------------------------
echo --- Windows Feedback app
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.WindowsFeedback'; if (!$package) {; Write-Host 'Not installed'; exit 0; }; $directories = @($package.InstallLocation, "^""$env:LOCALAPPDATA\Packages\$($package.PackageFamilyName)"^""); foreach($dir in $directories) {; if ( !$dir -Or !(Test-Path "^""$dir"^"") ) { continue }; cmd /c ('takeown /f "^""' + $dir + '"^"" /r /d y 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; cmd /c ('icacls "^""' + $dir + '"^"" /grant administrators:F /t 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; $files = Get-ChildItem -File -Path $dir -Recurse -Force; foreach($file in $files) {; if($file.Name.EndsWith('.OLD')) { continue }; $newName =  $file.FullName + '.OLD'; Write-Host "^""Rename '$($file.FullName)' to '$newName'"^""; Move-Item -LiteralPath "^""$($file.FullName)"^"" -Destination "^""$newName"^"" -Force; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------------CBS Preview app----------------------
:: ----------------------------------------------------------
echo --- CBS Preview app
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Windows.CBSPreview'; if (!$package) {; Write-Host 'Not installed'; exit 0; }; $directories = @($package.InstallLocation, "^""$env:LOCALAPPDATA\Packages\$($package.PackageFamilyName)"^""); foreach($dir in $directories) {; if ( !$dir -Or !(Test-Path "^""$dir"^"") ) { continue }; cmd /c ('takeown /f "^""' + $dir + '"^"" /r /d y 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; cmd /c ('icacls "^""' + $dir + '"^"" /grant administrators:F /t 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; $files = Get-ChildItem -File -Path $dir -Recurse -Force; foreach($file in $files) {; if($file.Name.EndsWith('.OLD')) { continue }; $newName =  $file.FullName + '.OLD'; Write-Host "^""Rename '$($file.FullName)' to '$newName'"^""; Move-Item -LiteralPath "^""$($file.FullName)"^"" -Destination "^""$newName"^"" -Force; }; }"
:: ----------------------------------------------------------