#!/bin/bash
#
# enforce_mac.sh  Author: Oaker Min (brootware)
# git clone https://github.com/brootware/privacy-sexy-lite.git
# Usage: sudo ./enforce_mac.sh  ( defaults to the menu system )
# command line arguments are valid, only catching 1 arguement
#
# Standard Disclaimer: Author assumes no liability for any damage done on your machine

# revision var
revision="0.0.2"

source bash_scripts/mac_privacy.sh
source bash_scripts/configure_programs.sh
source bash_scripts/nuke_history.sh
source bash_scripts/secure_mac.sh
source bash_scripts/privacy_cleanup.sh

check_for_root() {
    if [ "$EUID" -ne 0 ]; then
        echo -e "\n\n Script must be run with sudo ./enforce_mac.sh or as root \n"
        exit
    fi
}

harden_mac() {
    configure_mac_privacy
    configure_programs
    secure_mac
}

revert_hardening() {
    revert_configure_mac_privacy
    revert_configure_programs
    revert_secure_mac
}

# asciiart DO NOT MOVE
asciiart=$(base64 -d <<<"X19fX19fX19fXyAgICAgICAgLl9fICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX18gICAgICAgICAgICAgICAgICAgICAKXF9fX19fXyAgIFxfX19fX19ffF9ffF9fICBfX19fX19fICAgIF9fX18gX19fLl9fLi8gICBfX19fXy8gX19fXyBfX18gIF9fX19fXy5fXy4KIHwgICAgIF9fXy9cXyAgX18gXCAgXCAgXC8gL1xfXyAgXCBfLyBfX188ICAgfCAgfFxfX19fXyAgXF8vIF9fIFxcICBcLyAgPCAgIHwgIHwKIHwgICAgfCAgICAgfCAgfCBcLyAgfFwgICAvICAvIF9fIFxcICBcX19fXF9fXyAgfC8gICAgICAgIFwgIF9fXy8gPiAgICA8IFxfX18gIHwKIHxfX19ffCAgICAgfF9ffCAgfF9ffCBcXy8gIChfX19fICAvXF9fXyAgPiBfX19fL19fX19fX18gIC9cX19fICA+X18vXF8gXC8gX19fX3wKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXC8gICAgIFwvXC8gICAgICAgICAgICBcLyAgICAgXC8gICAgICBcL1wvICAgICAKCiAgICAgICAgICAgICAgICAgICAgKy0rLSstKy0rLSstKy0rICstKy0rICstKy0rLSstKy0rLSstKy0rLSsKICAgICAgICAgICAgICAgICAgICB8UHxvfHd8ZXxyfGV8ZHwgfGJ8eXwgfEJ8cnxvfG98dHx3fGF8cnxlfAogICAgICAgICAgICAgICAgICAgICstKy0rLSstKy0rLSstKyArLSstKyArLSstKy0rLSstKy0rLSstKy0r")

exit_screen() {
    echo -e "$asciiart"
    echo -e '\n\nYour privacy and security is now hardened 🎉💪'
    exit
}

mac_menu() {
    clear
    echo -e "$asciiart"
    echo -e "\n    Select an option from menu:                           Rev:$revision" # function call list
    echo -e "\n Key  Menu Option:             Description:"
    echo -e " ---  ------------             ------------"
    echo "  1 - Configure mac privacy       Enforce privacy on your mac "                                                             # configure_mac_privacy
    echo "  2 - Revert mac privacy config   Revert privacy config on your mac "                                                       # revert_configure_mac_privacy
    echo "  3 - Configure programs          Enforce 3rd party programs privacy on your mac "                                          # configure_programs
    echo "  4 - Revert Programs config      Revert 3rd party programs privacy CONFIG on your mac "                                    # revert_configure_programs
    echo "  5 - Secure your mac             Secure all the unused services on mac "                                                   # secure_mac
    echo "  6 - Revert security configs     Revert all the security configs on mac"                                                   # revert_secure_mac
    echo "  7 - Lite privacy cleanup        Small privacy clean up"                                                                   # privacy_cleanup
    echo -e "  8 - Nuke history                WARNING!!! This will remove all your bash history,os log and reset privacy settings\n" # nuke_history
    read -n1 -p "  Press key for menu item selection or press Q to exit: " menuinput

    case $menuinput in
    1) configure_mac_privacy ;;
    2) revert_configure_mac_privacy ;;
    3) configure_programs ;;
    4) revert_configure_programs ;;
    5) secure_mac ;;
    6) revert_secure_mac ;;
    7) privacy_cleanup ;;
    8) nuke_history ;;
    q | Q)
        echo -e "\n\n Exiting enforce_mac.sh - Happy computing! \n"
        exit_screen
        ;;
    *) mac_menu ;;
    esac
}

mac_help() {
    # do not edit this echo statement, spacing has been fixed and is correct for display in the terminal
    echo -e "\n valid command line arguements are : \n \n --menu          brings you to main menu of the program \n" \
        "--help          shows help menu for arguments \n --harden        run all security and privacy enforcements\n" \
        "--revert        revert all enforcements \n --cleanup       remove dns,bash,dropbox,ios photo caches\n" \
        "--nuke          remove all your bash history,os log and reset privacy settings"
    exit
}

check_arg() {
    if [ "$1" == "" ]; then
        mac_menu
    else
        case $1 in
        --menu) mac_menu ;;
        --help) mac_help ;;
        --harden) harden_mac ;;
        --revert) revert_hardening ;;
        --cleanup) privacy_cleanup ;;
        --nuke) nuke_history ;;
        *)
            mac_help
            exit 0
            ;;
        esac
    fi
}

check_for_root
check_arg "$1"
