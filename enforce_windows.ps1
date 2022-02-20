#TODO
#
# enforce_windows.ps1  Author: Oaker Min (brootware)
# git clone https://github.com/brootware/privacy-sexy-lite.git
# Usage: Type in powershell and press Ctrl+Shift+Enter or press and hold Ctrl+Shift. Click OK to make PowerShell run as administrator ./enforce_windows.ps1  ( defaults to the menu system )
# command line arguments are valid, only catching 1 arguement
#
# Standard Disclaimer: Author assumes no liability for any damage done on your machine

# revision var
$revision = "0.0.1"
$asciiart = "hello"
function win_menu {
    Clear-Host
    Write-Host "$asciiart"
    Write-Host  "\n    Select an option from menu:                           Rev:$revision"                                                                # function call list
    Write-Host  "\n Key  Menu Option:             Description:"
    Write-Host  " ---  ------------             ------------"
    Write-Host "  1 - Configure mac privacy       Enforce privacy on your mac "                                                             # configure_mac_privacy
    Write-Host "  2 - Revert mac privacy config   Revert privacy config on your mac "                                                       # revert_configure_mac_privacy
    Write-Host "  3 - Secure your mac             Secure all the unused services on mac "                                                   # secure_mac
    Write-Host "  4 - Revert security configs     Revert all the security configs on mac"                                                   # revert_secure_mac
    Write-Host "  5 - Privacy cleanup             WARNING!!! This will remove all your bash history,os log and reset privacy settings\n" # privacy_cleanup
    Write-Host "  Press key for menu item selection or press Q to exit "
    $selection = ([System.Console]::ReadKey(("NoEcho"))).KeyChar
    
    switch ($selection) {
        '1' {
            'You chose option #1'
        } '2' {
            'You chose option #2'
        } '3' {
            'You chose option #3'
        } 'q' {
            return
        }
    }
    pause
}

win_menu