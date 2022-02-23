#Requires -RunAsAdministrator
#
# enforce_windows.ps1  Author: Oaker Min (brootware)
# git clone https://github.com/brootware/privacy-sexy-lite.git
# Usage: Type in powershell and press Ctrl+Shift+Enter or press and hold Ctrl+Shift. Click OK to make PowerShell run as administrator ./enforce_windows.ps1  ( defaults to the menu system )
# command line arguments are valid, only catching 1 arguement
#
# Standard Disclaimer: Author assumes no liability for any damage done on your machine

param (
    [string]$choice
)

# revision var
$revision = "0.0.1"

function check_for_admin {
    # Check to make sure script is run as administrator
    Write-Host "[+] Checking if script is running as administrator.."
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
    if (-Not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "[ERR] Please run this script as administrator`n" -ForegroundColor Red
        Read-Host  "Press any key to continue"
        return
    }
}

function remove_bloatware {
    & '.\batch_scripts\remove_bloatware.bat'
}

function revert_some_bloatware {
    & '.\batch_scripts\revert_some_bloatware.bat'
}
function privacy_cleanup {
    & '.\batch_scripts\privacy_cleanup.bat'
}

function configure_window_privacy {
    & '.\batch_scripts\configure_window_privacy.bat'
}

function revert_configure_window_privacy {
    & '.\batch_scripts\revert_configure_window_privacy.bat'
}

function configure_programs {
    & '.\batch_scripts\configure_programs.bat'
}

function revert_configure_programs {
    & '.\batch_scripts\revert_configure_programs.bat'
}

function secure_window {
    & '.\batch_scripts\secure_window.bat'
}

function revert_secure_window {
    & '.\batch_scripts\revert_secure_window.bat'
}

function nuke_window {
    & '.\batch_scripts\nuke_window.bat'
}

function harden_window {
    configure_window_privacy
    configure_programs
    secure_window
}

function revert_hardening {
    revert_configure_window_privacy
    revert_configure_programs
    revert_secure_window
}

function privacy_bloat_cleanup {
    privacy_cleanup
    remove_bloatware
}

# asciiart DO NOT MOVE
$asciiart = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("X19fX19fX19fXyAgICAgICAgLl9fICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX18gICAgICAgICAgICAgICAgICAgICAKXF9fX19fXyAgIFxfX19fX19ffF9ffF9fICBfX19fX19fICAgIF9fX18gX19fLl9fLi8gICBfX19fXy8gX19fXyBfX18gIF9fX19fXy5fXy4KIHwgICAgIF9fXy9cXyAgX18gXCAgXCAgXC8gL1xfXyAgXCBfLyBfX188ICAgfCAgfFxfX19fXyAgXF8vIF9fIFxcICBcLyAgPCAgIHwgIHwKIHwgICAgfCAgICAgfCAgfCBcLyAgfFwgICAvICAvIF9fIFxcICBcX19fXF9fXyAgfC8gICAgICAgIFwgIF9fXy8gPiAgICA8IFxfX18gIHwKIHxfX19ffCAgICAgfF9ffCAgfF9ffCBcXy8gIChfX19fICAvXF9fXyAgPiBfX19fL19fX19fX18gIC9cX19fICA+X18vXF8gXC8gX19fX3wKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXC8gICAgIFwvXC8gICAgICAgICAgICBcLyAgICAgXC8gICAgICBcL1wvICAgICAKCiAgICAgICAgICAgICAgICAgICAgKy0rLSstKy0rLSstKy0rICstKy0rICstKy0rLSstKy0rLSstKy0rCiAgICAgICAgICAgICAgICAgICAgfHB8b3x3fGV8cnxlfGR8IHxifHl8IHxyfG98b3x0fHd8YXxyfGV8CiAgICAgICAgICAgICAgICAgICAgKy0rLSstKy0rLSstKy0rICstKy0rICstKy0rLSstKy0rLSstKy0r"))

function exit_screen {
    Write-Host "$asciiart"
    Write-Host "`n`nYour privacy and security is now hardened 🎉💪"
}



function win_menu {
    Clear-Host
    Write-Host "$asciiart"
    Write-Host  "`n    Select an option from menu:                           Rev:$revision"                                                        # function call list
    Write-Host  "`n Key  Menu Option:                Description:"
    Write-Host  " ---  ------------                  ------------"
    Write-Host "  1 - Configure window privacy       Enforce privacy on your window "                                                              # configure_window_privacy
    Write-Host "  2 - Revert window privacy config   Revert privacy config on your window "                                                        # revert_configure_window_privacy
    Write-Host "  3 - Configure programs             Enforce 3rd party programs privacy on your window "                                           # configure_programs
    Write-Host "  4 - Revert Programs config         Revert 3rd party programs privacy CONFIG on your window "                                     # revert_configure_programs
    Write-Host "  5 - Secure your window             Secure all the unused services on window "                                                    # secure_window
    Write-Host "  6 - Revert security configs        Revert all the security configs on window"                                                    # revert_secure_window
    Write-Host "  7 - Lite privacy cleanup           Small privacy clean up"                                                                       # privacy_cleanup
    Write-Host "  8 - Remove bloatware               Remove pre-installed windows store apps"                                                      # remove_bloatware
    Write-Host "  9 - Revert bloatware               Revert removing some pre-installed windows store apps"                                        # revert_some_bloatware
    Write-Host  "  0 - Nuke window                   WARNING!!! This will remove all your windows credentials,os log and reset privacy settings\n"        # nuke_window
    Write-Host "  `nPress key for menu item selection or press Q to exit "
    $selection = ([System.Console]::ReadKey(("NoEcho"))).KeyChar
    
    switch ($selection) {
        1 {
            configure_window_privacy
        } 2 {
            revert_configure_window_privacy
        } 3 {
            configure_programs
        } 4 {
            revert_configure_programs
        } 5 {
            secure_window
        } 6 {
            revert_secure_window
        } 7 {
            privacy_cleanup
        } 8 {
            remove_bloatware
        } 9 {
            revert_some_bloatware
        } 0 {
            nuke_window
        }
        
        q {
            Write-Host "`n`n Exiting enforce_windows.ps1 - Happy computing! `n"
            exit_screen
            return
        } Default {
            win_menu
        }
    }
}

function win_help {
    Write-Host "`n valid command line arguements are : `n `n   menu          brings you to main menu of the program `n" `
        "  help          shows help menu for arguments `n   harden        run all security and privacy enforcements`n" `
        "  revert        revert all enforcements `n   cleanup       remove non critical windows data`n" `
        "  nuke          remove all your OS history"
    return
    Write-Host "`n valid command line arguements are : `n `n harden        run all security and privacy enforcements `n" `
        "revert        revert all enforcements `n cleanup       remove all your bash history,os log and reset privacy settings" `
        return
}

check_for_admin
if ($choice -eq "") {
    win_menu
}
else {
    switch ($choice) {
        "menu" {
            win_menu
        }
        "help" {
            win_help
        }
        "harden" {
            harden_window
        }
        "revert" {
            revert_hardening
        }
        "cleanup" {
            privacy_bloat_cleanup
        }
        Default {
            win_help
        }
    }
}