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
asciiart=$(base64 -d <<<"H4sICLgND2IAA2FzY2lpLnR4dAClUNsKwjAMfd9XnEdBXH5g7EsCRdHnyRBEyMebS1M3LPhg2mXpOclJ01LSUG38hF37KtjZwI2sURHfrTA1zGmvkVKTGpy5Rg+QbEvsDBi+CQoUi6N00izNFa5t2GFw5CLpKhiqBjgrmgWynSWqwa4jlMNxXAOzHSZUWgV9zBD0wL31xyHuQpE7+2DUXiLhmI3jBVTwlzHVH1MXxp4euorH025h47erWyt3WeQpN1n1uwrkIi/1q6KLPJQ5O/NP3zd7wd+9mgIAAA==" | gunzip)

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
    echo "  1 - Configure mac privacy       Enforce privacy on your mac "                                                              # configure_mac_privacy
    echo "  2 - Revert mac privacy config   Revert privacy config on your mac "                                                        # revert_configure_mac_privacy
    echo "  3 - Configure programs          Enforce 3rd party programs privacy on your mac "                                           # configure_programs
    echo "  4 - Revert Programs config      Revert 3rd party programs privacy CONFIG on your mac "                                     # revert_configure_programs
    echo "  5 - Secure your mac             Secure all the unused services on mac "                                                    # secure_mac
    echo "  6 - Revert security configs     Revert all the security configs on mac"                                                    # revert_secure_mac
    echo "  7 - Lite privacy cleanup        Small privacy clean up"                                                                    # privacy_cleanup
    echo -e "  8 - Nuke history                 WARNING!!! This will remove all your bash history,os log and reset privacy settings\n" # nuke_history
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
