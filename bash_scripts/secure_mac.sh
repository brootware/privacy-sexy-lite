#!/bin/bash
secure_mac() {
    # ----------------------------------------------------------
    # ------------------Disable Captive portal------------------
    # ----------------------------------------------------------
    echo '--- Disable Captive portal'
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Enable application firewall----------------
    # ----------------------------------------------------------
    echo '--- Enable application firewall'
    /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
    sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool true
    defaults write com.apple.security.firewall EnableFirewall -bool true
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----------------Turn on firewall logging-----------------
    # ----------------------------------------------------------
    echo '--- Turn on firewall logging'
    /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
    sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -bool true
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------------Turn on stealth mode-------------------
    # ----------------------------------------------------------
    echo '--- Turn on stealth mode'
    /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
    sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true
    defaults write com.apple.security.firewall EnableStealthMode -bool true
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -Disable remote login (incoming SSH and SFTP connections)-
    # ----------------------------------------------------------
    echo '--- Disable remote login (incoming SSH and SFTP connections)'
    echo 'yes' | sudo systemsetup -setremotelogin off
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------Disable insecure TFTP service---------------
    # ----------------------------------------------------------
    echo '--- Disable insecure TFTP service'
    sudo launchctl disable 'system/com.apple.tftpd'
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----------Disable Bonjour multicast advertising-----------
    # ----------------------------------------------------------
    echo '--- Disable Bonjour multicast advertising'
    sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool true
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------Disable insecure telnet protocol-------------
    # ----------------------------------------------------------
    echo '--- Disable insecure telnet protocol'
    sudo launchctl disable system/com.apple.telnetd
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --Disable sharing of local printers with other computers--
    # ----------------------------------------------------------
    echo '--- Disable sharing of local printers with other computers'
    cupsctl --no-share-printers
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -Disable printing from any address including the Internet-
    # ----------------------------------------------------------
    echo '--- Disable printing from any address including the Internet'
    cupsctl --no-remote-any
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----------Disable remote printer administration-----------
    # ----------------------------------------------------------
    echo '--- Disable remote printer administration'
    cupsctl --no-remote-admin
    # ----------------------------------------------------------
}

revert_seure_mac() {
    # ----------------------------------------------------------
    # -----------Enable application firewall (revert)-----------
    # ----------------------------------------------------------
    echo '--- Enable application firewall (revert)'
    /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off
    sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool false
    defaults write com.apple.security.firewall EnableFirewall -bool false
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------Turn on firewall logging (revert)-------------
    # ----------------------------------------------------------
    echo '--- Turn on firewall logging (revert)'
    /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode off
    sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -bool false
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------Turn on stealth mode (revert)---------------
    # ----------------------------------------------------------
    echo '--- Turn on stealth mode (revert)'
    /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode off
    sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool false
    defaults write com.apple.security.firewall EnableStealthMode -bool false
    # ----------------------------------------------------------

    # Disable remote login (incoming SSH and SFTP connections) (revert)
    echo '--- Disable remote login (incoming SSH and SFTP connections) (revert)'
    sudo systemsetup -setremotelogin on
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----------Disable insecure TFTP service (revert)----------
    # ----------------------------------------------------------
    echo '--- Disable insecure TFTP service (revert)'
    sudo launchctl enable 'system/com.apple.tftpd'
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------Disable Bonjour multicast advertising (revert)------
    # ----------------------------------------------------------
    echo '--- Disable Bonjour multicast advertising (revert)'
    sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool false
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------Disable insecure telnet protocol (revert)---------
    # ----------------------------------------------------------
    echo '--- Disable insecure telnet protocol (revert)'
    sudo launchctl enable system/com.apple.telnetd
    # ----------------------------------------------------------

    # Disable sharing of local printers with other computers (revert)
    echo '--- Disable sharing of local printers with other computers (revert)'
    cupsctl --share-printers
    # ----------------------------------------------------------

    # Disable printing from any address including the Internet (revert)
    echo '--- Disable printing from any address including the Internet (revert)'
    cupsctl --remote-any
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------Disable remote printer administration (revert)------
    # ----------------------------------------------------------
    echo '--- Disable remote printer administration (revert)'
    cupsctl --remote-admin
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------Disable Captive portal (revert)--------------
    # ----------------------------------------------------------
    echo '--- Disable Captive portal (revert)'
    sudo defaults delete /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active
    # ----------------------------------------------------------
}
