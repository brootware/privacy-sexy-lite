#!/bin/bash
privacy_cleanup() {
    # ----------------------------------------------------------
    # ---------------------Clear DNS cache----------------------
    # ----------------------------------------------------------
    echo '--- Clear DNS cache'
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------------Purge inactive memory-------------------
    # ----------------------------------------------------------
    echo '--- Purge inactive memory'
    sudo purge
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------------Clear bash history--------------------
    # ----------------------------------------------------------
    echo '--- Clear bash history'
    rm -f ~/.bash_history
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------------Clear zsh history---------------------
    # ----------------------------------------------------------
    echo '--- Clear zsh history'
    rm -f ~/.zsh_history
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------------Clear Adobe cache---------------------
    # ----------------------------------------------------------
    echo '--- Clear Adobe cache'
    sudo rm -rfv ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/* &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------------Clear Dropbox cache--------------------
    # ----------------------------------------------------------
    echo '--- Clear Dropbox cache'
    if [ -d "/Users/${HOST}/Dropbox" ]; then
        sudo rm -rfv ~/Dropbox/.dropbox.cache/* &>/dev/null
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----------Clear Google Drive file stream cache-----------
    # ----------------------------------------------------------
    echo '--- Clear Google Drive file stream cache'
    killall "Google Drive File Stream"
    rm -rfv ~/Library/Application\ Support/Google/DriveFS/[0-9a-zA-Z]*/content_cache &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------------Clear iOS photo caches------------------
    # ----------------------------------------------------------
    echo '--- Clear iOS photo caches'
    rm -rf ~/Pictures/iPhoto\ Library/iPod\ Photo\ Cache/*
    # ----------------------------------------------------------
}
