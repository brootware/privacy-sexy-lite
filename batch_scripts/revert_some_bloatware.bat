:: ----------------------------------------------------------
:: ------------------My Office app (revert)------------------
:: ----------------------------------------------------------
echo --- My Office app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.MicrosoftOfficeHub'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.MicrosoftOfficeHub'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Xbox Console Companion app (revert)------------
:: ----------------------------------------------------------
echo --- Xbox Console Companion app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.XboxApp'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.XboxApp'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Xbox Live in-game experience app (revert)---------
:: ----------------------------------------------------------
echo --- Xbox Live in-game experience app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.Xbox.TCUI'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.Xbox.TCUI'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Xbox Game Bar app (revert)----------------
:: ----------------------------------------------------------
echo --- Xbox Game Bar app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.XboxGamingOverlay'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.XboxGamingOverlay'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Xbox Game Bar Plugin appcache (revert)----------
:: ----------------------------------------------------------
echo --- Xbox Game Bar Plugin appcache (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.XboxGameOverlay'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.XboxGameOverlay'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Xbox Identity Provider app (revert)------------
:: ----------------------------------------------------------
echo --- Xbox Identity Provider app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.XboxIdentityProvider'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.XboxIdentityProvider'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Xbox Speech To Text Overlay app (revert)---------
:: ----------------------------------------------------------
echo --- Xbox Speech To Text Overlay app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.XboxSpeechToTextOverlay'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.XboxSpeechToTextOverlay'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Uninstall Cortana app (revert)--------------
:: ----------------------------------------------------------
echo --- Uninstall Cortana app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.549981C3F5F10'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.549981C3F5F10'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: Windows 10 Family Safety / Parental Controls app (revert)-
:: ----------------------------------------------------------
echo --- Windows 10 Family Safety / Parental Controls app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.Windows.ParentalControls'; if (!$package) {; Write-Error 'App could not be found' -ErrorAction Stop; }; $directories = @($package.InstallLocation, "^""$env:LOCALAPPDATA\Packages\$($package.PackageFamilyName)"^""); foreach($dir in $directories) {; if ( !$dir -Or !(Test-Path "^""$dir"^"") ) { continue; }; cmd /c ('takeown /f "^""' + $dir + '"^"" /r /d y 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; cmd /c ('icacls "^""' + $dir + '"^"" /grant administrators:F /t 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; $files = Get-ChildItem -File -Path "^""$dir\*.OLD"^"" -Recurse -Force; foreach($file in $files) {; $newName = $file.FullName.Substring(0, $file.FullName.Length - 4); Write-Host "^""Rename '$($file.FullName)' to '$newName'"^""; Move-Item -LiteralPath "^""$($file.FullName)"^"" -Destination "^""$newName"^"" -Force; }; }"
:: ----------------------------------------------------------