#!/bin/bash
nuke_history() {
    # ----------------------------------------------------------
    # --------------------Clear bash history--------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear bash history'
    rm -f ~/.bash_history
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------------Clear zsh history---------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear zsh history'
    rm -f ~/.zsh_history
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------Clear system application logs---------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear system application logs'
    sudo rm -rfv /Library/Logs/*
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------------Clear Mail logs----------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Mail logs'
    rm -rfv ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/*
    # ----------------------------------------------------------

    # Clear audit logs (login, logout, authentication and other user activity)
    echo -e '\n--- Clear audit logs (login, logout, authentication and other user activity)'
    sudo rm -rfv /var/audit/*
    sudo rm -rfv /private/var/audit/*
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------Clear user logs (user reports)--------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear user logs (user reports)'
    sudo rm -rfv ~/Library/Logs/*
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------------Clear daily logs---------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear daily logs'
    sudo rm -fv /System/Library/LaunchDaemons/com.apple.periodic-*.plist
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------Clear receipt logs for installed packages/apps------
    # ----------------------------------------------------------
    echo -e '\n--- Clear receipt logs for installed packages/apps'
    sudo rm -rfv /var/db/receipts/*
    sudo rm -vf /Library/Receipts/InstallHistory.plist
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------------Clear diagnostics logs------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear diagnostics logs'
    sudo rm -rfv /private/var/db/diagnostics/*
    sudo rm -rfv /var/db/diagnostics/*
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------Clear shared-cache strings data--------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear shared-cache strings data'
    sudo rm -rfv /private/var/db/uuidtext/
    sudo rm -rfv /var/db/uuidtext/
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------Clear Apple System Logs (ASL)---------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Apple System Logs (ASL)'
    sudo rm -rfv /private/var/log/asl/*
    sudo rm -rfv /var/log/asl/*
    sudo rm -fv /var/log/asl.log # Legacy ASL (10.4)
    sudo rm -fv /var/log/asl.db
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------------Clear install logs--------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear install logs'
    sudo rm -fv /var/log/install.log
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------------Clear all system logs-------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear all system logs'
    sudo rm -rfv /var/log/*
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----------Clear Google Chrome browsing history-----------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Google Chrome browsing history'
    rm -rfv ~/Library/Application\ Support/Google/Chrome/Default/History &>/dev/null
    rm -rfv ~/Library/Application\ Support/Google/Chrome/Default/History-journal &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----------------Google Chrome Cache Files-----------------
    # ----------------------------------------------------------
    echo -e '\n--- Google Chrome Cache Files'
    sudo rm -rfv ~/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/* &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------Clear Safari browsing history---------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Safari browsing history'
    rm -f ~/Library/Safari/History.db
    rm -f ~/Library/Safari/History.db-lock
    rm -f ~/Library/Safari/History.db-shm
    rm -f ~/Library/Safari/History.db-wal
    # For older versions of Safari
    rm -f ~/Library/Safari/History.plist   # URL, visit count, webpage title, last visited timestamp, redirected URL, autocomplete
    rm -f ~/Library/Safari/HistoryIndex.sk # History index
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------Clear Safari downloads history--------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Safari downloads history'
    rm -f ~/Library/Safari/Downloads.plist
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------------Clear Safari top sites------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Safari top sites'
    rm -f ~/Library/Safari/TopSites.plist
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------Clear Safari last session (open tabs) history-------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Safari last session (open tabs) history'
    rm -f ~/Library/Safari/LastSession.plist
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------Clear copy of the Safari history-------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear copy of the Safari history'
    rm -rfv ~/Library/Caches/Metadata/Safari/History
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---Clear search history embedded in Safari preferences----
    # ----------------------------------------------------------
    echo -e '\n--- Clear search history embedded in Safari preferences'
    defaults write ~/Library/Preferences/com.apple.Safari RecentSearchStrings '( )'
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------------Clear Safari cookies-------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Safari cookies'
    rm -f ~/Library/Cookies/Cookies.binarycookies
    # Used before Safari 5.1
    rm -f ~/Library/Cookies/Cookies.plist
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------Clear Safari zoom level preferences per site-------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Safari zoom level preferences per site'
    rm -f ~/Library/Safari/PerSiteZoomPreferences.plist
    # ----------------------------------------------------------

    # Clear URLs that are allowed to display notifications in Safari
    echo -e '\n--- Clear URLs that are allowed to display notifications in Safari'
    rm -f ~/Library/Safari/UserNotificationPreferences.plist
    # ----------------------------------------------------------

    # Clear Safari per-site preferences for Downloads, Geolocation, PopUps, and Autoplays
    echo -e '\n--- Clear Safari per-site preferences for Downloads, Geolocation, PopUps, and Autoplays'
    rm -f ~/Library/Safari/PerSitePreferences.db
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------Clear Safari cached blobs, URLs and timestamps------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Safari cached blobs, URLs and timestamps'
    rm -f ~/Library/Caches/com.apple.Safari/Cache.db
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----Clear Safari web page icons displayed on URL bar-----
    # ----------------------------------------------------------
    echo -e '\n--- Clear Safari web page icons displayed on URL bar'
    rm -f ~/Library/Safari/WebpageIcons.db
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------Clear Safari webpage previews (thumbnails)--------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Safari webpage previews (thumbnails)'
    rm -rfv ~/Library/Caches/com.apple.Safari/Webpage\ Previews
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------------Clear Firefox cache--------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Firefox cache'
    sudo rm -rf ~/Library/Caches/Mozilla/
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/netpredictions.sqlite
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Delete Firefox form history----------------
    # ----------------------------------------------------------
    echo -e '\n--- Delete Firefox form history'
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/formhistory.sqlite
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/formhistory.dat
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------Delete Firefox site preferences--------------
    # ----------------------------------------------------------
    echo -e '\n--- Delete Firefox site preferences'
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/content-prefs.sqlite
    # ----------------------------------------------------------

    # Delete Firefox session restore data (loads after the browser closes or crashes)
    echo -e '\n--- Delete Firefox session restore data (loads after the browser closes or crashes)'
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionCheckpoints.json
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore*.js*
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore.bak*
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore-backups/previous.js*
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore-backups/recovery.js*
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore-backups/recovery.bak*
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore-backups/previous.bak*
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore-backups/upgrade.js*-20*
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----------------Delete Firefox passwords-----------------
    # ----------------------------------------------------------
    echo -e '\n--- Delete Firefox passwords'
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/signons.txt
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/signons2.txt
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/signons3.txt
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/signons.sqlite
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/logins.json
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Delete Firefox HTML5 cookies---------------
    # ----------------------------------------------------------
    echo -e '\n--- Delete Firefox HTML5 cookies'
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/webappsstore.sqlite
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Delete Firefox crash reports---------------
    # ----------------------------------------------------------
    echo -e '\n--- Delete Firefox crash reports'
    rm -rfv ~/Library/Application\ Support/Firefox/Crash\ Reports/
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/minidumps/*.dmp
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Delete Firefox backup files----------------
    # ----------------------------------------------------------
    echo -e '\n--- Delete Firefox backup files'
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/bookmarkbackups/*.json
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/bookmarkbackups/*.jsonlz4
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------------Delete Firefox cookies------------------
    # ----------------------------------------------------------
    echo -e '\n--- Delete Firefox cookies'
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/cookies.txt
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/cookies.sqlite
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/cookies.sqlite-shm
    rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/cookies.sqlite-wal
    rm -rfv ~/Library/Application\ Support/Firefox/Profiles/*/storage/default/http*
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------------Clear Adobe cache---------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Adobe cache'
    sudo rm -rfv ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/* &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------------Clear Gradle cache--------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Gradle cache'
    if [ -d "/Users/${HOST}/.gradle/caches" ]; then
        rm -rfv ~/.gradle/caches/ &>/dev/null
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------------Clear Dropbox cache--------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Dropbox cache'
    if [ -d "/Users/${HOST}/Dropbox" ]; then
        sudo rm -rfv ~/Dropbox/.dropbox.cache/* &>/dev/null
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----------Clear Google Drive file stream cache-----------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Google Drive file stream cache'
    killall "Google Drive File Stream"
    rm -rfv ~/Library/Application\ Support/Google/DriveFS/[0-9a-zA-Z]*/content_cache &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------------Clear Composer cache-------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Composer cache'
    if type "composer" &>/dev/null; then
        composer clearcache &>/dev/null
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------------Clear Homebrew cache-------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Homebrew cache'
    if type "brew" &>/dev/null; then
        brew cleanup -s &>/dev/null
        rm -rfv $(brew --cache) &>/dev/null
        brew tap --repair &>/dev/null
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----------Clear any old versions of Ruby gems------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear any old versions of Ruby gems'
    if type "gem" &>/dev/null; then
        gem cleanup &>/dev/null
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----------------------Clear Docker-----------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Docker'
    if type "docker" &>/dev/null; then
        docker system prune -af
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Clear Pyenv-VirtualEnv cache---------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Pyenv-VirtualEnv cache'
    if [ "$PYENV_VIRTUALENV_CACHE_PATH" ]; then
        rm -rfv $PYENV_VIRTUALENV_CACHE_PATH &>/dev/null
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------------Clear NPM cache----------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear NPM cache'
    if type "npm" &>/dev/null; then
        npm cache clean --force
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------------Clear Yarn cache---------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear Yarn cache'
    if type "yarn" &>/dev/null; then
        echo -e '\nCleanup Yarn Cache...'
        yarn cache clean --force
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------------Clear iOS applications------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear iOS applications'
    rm -rfv ~/Music/iTunes/iTunes\ Media/Mobile\ Applications/* &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------------Clear iOS photo caches------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear iOS photo caches'
    rm -rf ~/Pictures/iPhoto\ Library/iPod\ Photo\ Cache/*
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----------------Remove iOS Device Backups-----------------
    # ----------------------------------------------------------
    echo -e '\n--- Remove iOS Device Backups'
    rm -rfv ~/Library/Application\ Support/MobileSync/Backup/* &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------------Clear iOS Simulators-------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear iOS Simulators'
    if type "xcrun" &>/dev/null; then
        osascript -e 'tell application "com.apple.CoreSimulator.CoreSimulatorService" to quit'
        osascript -e 'tell application "iOS Simulator" to quit'
        osascript -e 'tell application "Simulator" to quit'
        xcrun simctl shutdown all
        xcrun simctl erase all
    fi
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------Clear the list of iOS devices connected----------
    # ----------------------------------------------------------
    echo -e '\n--- Clear the list of iOS devices connected'
    sudo defaults delete /Users/$USER/Library/Preferences/com.apple.iPod.plist "conn:128:Last Connect"
    sudo defaults delete /Users/$USER/Library/Preferences/com.apple.iPod.plist Devices
    sudo defaults delete /Library/Preferences/com.apple.iPod.plist "conn:128:Last Connect"
    sudo defaults delete /Library/Preferences/com.apple.iPod.plist Devices
    sudo rm -rfv /var/db/lockdown/*
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----------------Reset camera permissions-----------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset camera permissions'
    tccutil reset Camera
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Reset microphone permissions---------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset microphone permissions'
    tccutil reset Microphone
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------Reset accessibility permissions--------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset accessibility permissions'
    tccutil reset Accessibility
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------Reset screen capture permissions-------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset screen capture permissions'
    tccutil reset ScreenCapture
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Reset reminders permissions----------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset reminders permissions'
    tccutil reset Reminders
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----------------Reset photos permissions-----------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset photos permissions'
    tccutil reset Photos
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----------------Reset calendar permissions----------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset calendar permissions'
    tccutil reset Calendar
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------Reset full disk access permissions------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset full disk access permissions'
    tccutil reset SystemPolicyAllFiles
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----------------Reset contacts permissions----------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset contacts permissions'
    tccutil reset SystemPolicyAllFiles
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -------------Reset desktop folder permissions-------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset desktop folder permissions'
    tccutil reset SystemPolicyDesktopFolder
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------Reset documents folder permissions------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset documents folder permissions'
    tccutil reset SystemPolicyDocumentsFolder
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Reset downloads permissions----------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset downloads permissions'
    tccutil reset SystemPolicyDownloadsFolder
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----------------Reset all app permissions-----------------
    # ----------------------------------------------------------
    echo -e '\n--- Reset all app permissions'
    tccutil reset All
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------Clear CUPS printer job cache---------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear CUPS printer job cache'
    sudo rm -rfv /var/spool/cups/c0*
    sudo rm -rfv /var/spool/cups/tmp/*
    sudo rm -rfv /var/spool/cups/cache/job.cache*
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----------------Empty trash on all volumes----------------
    # ----------------------------------------------------------
    echo -e '\n--- Empty trash on all volumes'
    # on all mounted volumes
    sudo rm -rfv /Volumes/*/.Trashes/* &>/dev/null
    # on main HDD
    sudo rm -rfv ~/.Trash/* &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # -----------------Clear system cache files-----------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear system cache files'
    sudo rm -rfv /Library/Caches/* &>/dev/null
    sudo rm -rfv /System/Library/Caches/* &>/dev/null
    sudo rm -rfv ~/Library/Caches/* &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----------Clear XCode Derived Data and Archives-----------
    # ----------------------------------------------------------
    echo -e '\n--- Clear XCode Derived Data and Archives'
    rm -rfv ~/Library/Developer/Xcode/DerivedData/* &>/dev/null
    rm -rfv ~/Library/Developer/Xcode/Archives/* &>/dev/null
    rm -rfv ~/Library/Developer/Xcode/iOS Device Logs/* &>/dev/null
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------------------Clear DNS cache----------------------
    # ----------------------------------------------------------
    echo -e '\n--- Clear DNS cache'
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------------Purge inactive memory-------------------
    # ----------------------------------------------------------
    echo -e '\n--- Purge inactive memory'
    sudo purge
    # ----------------------------------------------------------
}
