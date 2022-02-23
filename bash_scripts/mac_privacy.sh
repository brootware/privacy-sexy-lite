#!/bin/bash
configure_mac_privacy() {
    # ----------------------------------------------------------
    # ---------------Disable Remote Apple Events----------------
    # ----------------------------------------------------------
    echo -e '\n--- Disable Remote Apple Events'
    sudo systemsetup -setremoteappleevents off
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Disable AirDrop file sharing---------------
    # ----------------------------------------------------------
    echo -e '\n--- Disable AirDrop file sharing'
    defaults write com.apple.NetworkBrowser DisableAirDrop -bool true
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------Opt-out from Siri data collection-------------
    # ----------------------------------------------------------
    echo -e '\n--- Opt-out from Siri data collection'
    defaults write com.apple.assistant.support 'Siri Data Sharing Opt-In Status' -int 2
    # ----------------------------------------------------------
}

revert_configure_mac_privacy() {
    # ----------------------------------------------------------
    # -----------Disable Remote Apple Events (revert)-----------
    # ----------------------------------------------------------
    echo -e '\n--- Disable Remote Apple Events (revert)'
    sudo systemsetup -setremoteappleevents on
    # ----------------------------------------------------------

    # ----------------------------------------------------------

    # ----------Disable AirDrop file sharing (revert)-----------
    # ----------------------------------------------------------
    echo -e '\n--- Disable AirDrop file sharing (revert)'
    defaults write com.apple.NetworkBrowser DisableAirDrop -bool false
    # ----------------------------------------------------------
    # ----------------------------------------------------------

    # --------Opt-out from Siri data collection (revert)--------
    # ----------------------------------------------------------
    echo -e '\n--- Opt-out from Siri data collection (revert)'
    defaults delete com.apple.assistant.support 'Siri Data Sharing Opt-In Status'
    # ----------------------------------------------------------
}
