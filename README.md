# Privacy-sexy-lite

<p align="center">
  <img width="300" height="300" src="./privacyascii.png" alt="Privacy is sexy!"/>
</p>

A lite CLI version of Open-source tool to enforce privacy & security best-practices on Windows and macOS. Originally a web app by [undergroundwires](https://github.com/undergroundwires). 🍑 🍆

This tool is customized from original site [privacy.sexy](https://privacy.sexy) to fit privacy and security needs for my mac and windows VMs.

> Standard Disclaimer: Author assumes no liability for any damage done on your machines.

## How to use for Mac

```bash
rm -rf privacy-sexy-lite
git clone https://github.com/brootware/privacy-sexy-lite
cd privacy-sexy-lite
chmod +x enforce_mac.sh
sudo ./enforce_mac.sh --help
```

## What's included in Mac?

1. **Secure Mac**
    1. Disable remote login
    2. Disable insecure TFTP service
    3. Disable Bonjour multicast advertising
    4. Disable insecure telnet protocol
    5. Disable sharing of local printers with other computers
    6. Disable printing from any address including the Internet
    7. Disable remote printer administration
    8. Disable Captive portal
2. **Configure Privacy**
    1. Disable Remote Apple Events
    2. Disable AirDrop file sharing
    3. Opt-out from Siri data collection
3. **Prviacy cleanup**
    1. Clear Terminal History
    2. Clear OS Logs
    3. Clear Browser History
    4. Clear 3rd party application data
    5. IOS Cleanup
    6. Reset Privacy Permissions for all applications
    7. Clear cups printer job acache
    8. Empty trash on all volumes
    9. Clear system cache files
    10. Clear XCode derived data and archives
    11. Clear DNS Cache
    12. Purge inactive memory

## How to use for Windows

Right click > Run Powershell As Administrator

```powershell
rm -Force privacy-sexy-lite
git clone https://github.com/brootware/privacy-sexy-lite
cd privacy-sexy-lite
.\enforce_windows.ps1 help
```

## What's included in Windows?

1. **Secure windows**
    1. Disable unsafe features
    2. Disable administrative shares
    3. Disable autoplay and autorun
    4. Disable remote assitance
    5. Disable lock screen camera
    6. Prevent the storage of lan manager hash of passwords
    7. Disable windows installer always install with elevated privileges
    8. Prevent WinRM from using basic authentication
    9. Restrict anonymous enmeration of shares
    10. Refuse less secure authentication
    11. Enable structured exception handling overwrite protection
    12. Block anonymous enumeration of SAM accounts
    13. Restrict anonymous access to named pipes and shares
    14. Disable the windows connect now wizard
2. **Configure privacy**
    1. Disable windows telemetry and data collection
    2. Deny app access to personal information
    3. Disable location access
    4. Disable window search data collection
    5. Disable targeted ads and marketing
    6. Disable windows insider program
    7. Disable cloud sync
    8. Disable cloud speech recognition
    9. Opt out from windows privacy consent
    10. Disable windows feedback
    11. Disable text and handwriting collection
    12. Disable turn off sensors
    13. Disable wi-fi sense
    14. Disable inventory collector
    15. Disable website access of language list
    16. Disable auto downloading maps
    17. Disable steps recorder
    18. Disable game screen recording
    19. Disable Windows DRM internet access
    20. Disable feedback on write(Sending type info to Microsoft)
    21. Disable activity feed
    22. Disable media player data collection
    23. Disable Xbox services
    24. Disable Microsoft retail demo experience

    *and many more....*
3. **Privacy & bloatware cleanup**
    1. Clear app, browser history
    2. Clear windows logs and caches
    3. Delete controversial Default0 User
    4. Enable reset base in DISM component store
    5. Remove Default apps associations
    6. Clear (RESET) network data usage
    7. Uninstall MSN(BING), Office, XBox, Cortana, Feedback hub, Windows maps app
    8. Uninstall Microsoft advertising app, Network speed test app.
    9. Uninstall holographic first run app, family safety/parental controls app, Windows feedback app, CBS Preview app
