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

# function check_for_admin {
#     # Check to make sure script is run as administrator
#     Write-Host "[+] Checking if script is running as administrator.."
#     $currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
#     if (-Not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
#         Write-Host "[ERR] Please run this script as administrator`n" -ForegroundColor Red
#         Read-Host  "Press any key to continue"
#         exit
#     }
# }

# asciiart DO NOT MOVE
$asciiart = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("X19fX19fX19fXyAgICAgICAgLl9fICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX18gICAgICAgICAgICAgICAgICAgICAKXF9fX19fXyAgIFxfX19fX19ffF9ffF9fICBfX19fX19fICAgIF9fX18gX19fLl9fLi8gICBfX19fXy8gX19fXyBfX18gIF9fX19fXy5fXy4KIHwgICAgIF9fXy9cXyAgX18gXCAgXCAgXC8gL1xfXyAgXCBfLyBfX188ICAgfCAgfFxfX19fXyAgXF8vIF9fIFxcICBcLyAgPCAgIHwgIHwKIHwgICAgfCAgICAgfCAgfCBcLyAgfFwgICAvICAvIF9fIFxcICBcX19fXF9fXyAgfC8gICAgICAgIFwgIF9fXy8gPiAgICA8IFxfX18gIHwKIHxfX19ffCAgICAgfF9ffCAgfF9ffCBcXy8gIChfX19fICAvXF9fXyAgPiBfX19fL19fX19fX18gIC9cX19fICA+X18vXF8gXC8gX19fX3wKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXC8gICAgIFwvXC8gICAgICAgICAgICBcLyAgICAgXC8gICAgICBcL1wvICAgICAKCiAgICAgICAgICAgICAgICAgICAgKy0rLSstKy0rLSstKy0rICstKy0rICstKy0rLSstKy0rLSstKy0rCiAgICAgICAgICAgICAgICAgICAgfHB8b3x3fGV8cnxlfGR8IHxifHl8IHxyfG98b3x0fHd8YXxyfGV8CiAgICAgICAgICAgICAgICAgICAgKy0rLSstKy0rLSstKy0rICstKy0rICstKy0rLSstKy0rLSstKy0r"))

function exit_screen {
    Write-Host "$asciiart"
    Write-Host "`n`nYour privacy and security is now hardened 🎉💪"
}

function win_menu {
    Clear-Host
    Write-Host "$asciiart"
    Write-Host  "`n    Select an option from menu:                           Rev:$revision"                                                                # function call list
    Write-Host  "`n Key  Menu Option:             Description:"
    Write-Host  " ---  ------------             ------------"
    Write-Host "  1 - Configure mac privacy       Enforce privacy on your mac "                                                             # configure_mac_privacy
    Write-Host "  2 - Revert mac privacy config   Revert privacy config on your mac "                                                       # revert_configure_mac_privacy
    Write-Host "  3 - Secure your mac             Secure all the unused services on mac "                                                   # secure_mac
    Write-Host "  4 - Revert security configs     Revert all the security configs on mac"                                                   # revert_secure_mac
    Write-Host "  5 - Privacy cleanup             WARNING!!! This will remove all your bash history,os log and reset privacy settings"      # privacy_cleanup
    Write-Host "  `nPress key for menu item selection or press Q to exit "
    $selection = ([System.Console]::ReadKey(("NoEcho"))).KeyChar
    
    switch ($selection) {
        1 {
            'You chose option #1'
        } 2 {
            'You chose option #2'
        } 3 {
            'You chose option #3'
        } q {
            Write-Host "`n`n Exiting enforce_windows.ps1 - Happy computing! `n"
            exit_screen
            return
        } Default {
            win_menu
        }
    }
}

function win_help {
    Write-Host "`n valid command line arguements are : `n `n harden        run all security and privacy enforcements `n" `
        "revert        revert all enforcements `n cleanup       remove all your bash history,os log and reset privacy settings" `
        return
}


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
            # harden_win
            "This function has not been written yet"
        }
        "revert" {
            # revert_hardening
            "This function has not been written yet"
        }
        "cleanup" {
            # privacy_cleanup
            "This function has not been written yet"
        }
        Default {
            win_help
        }
    }
}