:: ----------------------------------------------------------
:: ----------Disable unsafe SMBv1 protocol (revert)----------
:: ----------------------------------------------------------
echo --- Disable unsafe SMBv1 protocol (revert)
dism /online /Enable-Feature /FeatureName:"SMB1Protocol" /NoRestart
dism /Online /Enable-Feature /FeatureName:"SMB1Protocol-Client" /NoRestart
dism /Online /Enable-Feature /FeatureName:"SMB1Protocol-Server" /NoRestart
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: Disable PowerShell 2.0 against downgrade attacks (revert)-
:: ----------------------------------------------------------
echo --- Disable PowerShell 2.0 against downgrade attacks (revert)
dism /online /Enable-Feature /FeatureName:"MicrosoftWindowsPowerShellV2Root" /NoRestart
dism /online /Enable-Feature /FeatureName:"MicrosoftWindowsPowerShellV2" /NoRestart
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable administrative shares (revert)----------
:: ----------------------------------------------------------
echo --- Disable administrative shares (revert)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable AutoPlay and AutoRun (revert)-----------
:: ----------------------------------------------------------
echo --- Disable AutoPlay and AutoRun (revert)
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutorun" /t REG_DWORD /d 2 /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoAutoplayfornonVolume" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable remote Assistance (revert)------------
:: ----------------------------------------------------------
echo --- Disable remote Assistance (revert)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable lock screen camera (revert)------------
:: ----------------------------------------------------------
echo --- Disable lock screen camera (revert)
reg delete "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v NoLockScreenCamera /f
:: ----------------------------------------------------------


:: Prevent the storage of the LAN Manager hash of passwords (revert)
echo --- Prevent the storage of the LAN Manager hash of passwords (revert)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "NoLMHash" /t REG_DWORD /d 10 /f
:: ----------------------------------------------------------


:: Disable Windows Installer Always install with elevated privileges (revert)
echo --- Disable Windows Installer Always install with elevated privileges (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" /v "AlwaysInstallElevated" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Prevent WinRM from using Basic Authentication (revert)--
:: ----------------------------------------------------------
echo --- Prevent WinRM from using Basic Authentication (revert)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" /v "AllowBasic" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Restrict anonymous enumeration of shares (revert)-----
:: ----------------------------------------------------------
echo --- Restrict anonymous enumeration of shares (revert)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\LSA" /v "RestrictAnonymous" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Refuse less secure authentication (revert)--------
:: ----------------------------------------------------------
echo --- Refuse less secure authentication (revert)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" /t REG_DWORD /d 3 /f
:: ----------------------------------------------------------


:: Enable Structured Exception Handling Overwrite Protection (SEHOP) (revert)
echo --- Enable Structured Exception Handling Overwrite Protection (SEHOP) (revert)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Block Anonymous enumeration of SAM accounts (revert)---
:: ----------------------------------------------------------
echo --- Block Anonymous enumeration of SAM accounts (revert)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "RestrictAnonymousSAM" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: Restrict anonymous access to Named Pipes and Shares (revert)
echo --- Restrict anonymous access to Named Pipes and Shares (revert)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters" /v "RestrictNullSessAccess" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable the Windows Connect Now wizard (revert)------
:: ----------------------------------------------------------
echo --- Disable the Windows Connect Now wizard (revert)
reg add "HKLM\Software\Policies\Microsoft\Windows\WCN\UI" /v "DisableWcnUi" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableFlashConfigRegistrar" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableInBand802DOT11Registrar" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableUPnPRegistrar" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableWPDRegistrar" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" /v "EnableRegistrars" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------