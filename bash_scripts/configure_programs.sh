#!/bin/bash
configure_programs() {
    # ----------------------------------------------------------
    # ----------------Disable Firefox telemetry-----------------
    # ----------------------------------------------------------
    echo '--- Disable Firefox telemetry'
    # Enable Firefox policies so the telemetry can be configured.
    sudo defaults write /Library/Preferences/org.mozilla.firefox EnterprisePoliciesEnabled -bool TRUE
    # Disable sending usage data
    sudo defaults write /Library/Preferences/org.mozilla.firefox DisableTelemetry -bool TRUE
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----Disable Microsoft Office diagnostics data sending-----
    # ----------------------------------------------------------
    echo '--- Disable Microsoft Office diagnostics data sending'
    defaults write com.microsoft.office DiagnosticDataTypePreference -string ZeroDiagnosticData
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------Disable Homebrew user behavior analytics---------
    # ----------------------------------------------------------
    echo '--- Disable Homebrew user behavior analytics'
    command='export HOMEBREW_NO_ANALYTICS=1'
    declare -a profile_files=("$HOME/.bash_profile" "$HOME/.zprofile")
    for profile_file in "${profile_files[@]}"; do
        touch "$profile_file"
        if ! grep -q "$command" "${profile_file}"; then
            echo "$command" >>"$profile_file"
            echo "[$profile_file] Configured"
        else
            echo "[$profile_file] No need for any action, already configured"
        fi
    done
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------------Disable NET Core CLI telemetry--------------
    # ----------------------------------------------------------
    echo '--- Disable NET Core CLI telemetry'
    command='export DOTNET_CLI_TELEMETRY_OPTOUT=1'
    declare -a profile_files=("$HOME/.bash_profile" "$HOME/.zprofile")
    for profile_file in "${profile_files[@]}"; do
        touch "$profile_file"
        if ! grep -q "$command" "${profile_file}"; then
            echo "$command" >>"$profile_file"
            echo "[$profile_file] Configured"
        else
            echo "[$profile_file] No need for any action, already configured"
        fi
    done
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ------------Disable PowerShell Core telemetry-------------
    # ----------------------------------------------------------
    echo '--- Disable PowerShell Core telemetry'
    command='export POWERSHELL_TELEMETRY_OPTOUT=1'
    declare -a profile_files=("$HOME/.bash_profile" "$HOME/.zprofile")
    for profile_file in "${profile_files[@]}"; do
        touch "$profile_file"
        if ! grep -q "$command" "${profile_file}"; then
            echo "$command" >>"$profile_file"
            echo "[$profile_file] Configured"
        else
            echo "[$profile_file] No need for any action, already configured"
        fi
    done
    # ----------------------------------------------------------
}

revert_configure_programs() {
    # ----------------------------------------------------------
    # ------------Disable Firefox telemetry (revert)------------
    # ----------------------------------------------------------
    echo '--- Disable Firefox telemetry (revert)'
    sudo defaults delete /Library/Preferences/org.mozilla.firefox EnterprisePoliciesEnabled
    sudo defaults delete /Library/Preferences/org.mozilla.firefox DisableTelemetry
    # ----------------------------------------------------------

    # Disable Microsoft Office diagnostics data sending (revert)
    echo '--- Disable Microsoft Office diagnostics data sending (revert)'
    defaults delete com.microsoft.office DiagnosticDataTypePreference
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ----Disable Homebrew user behavior analytics (revert)-----
    # ----------------------------------------------------------
    echo '--- Disable Homebrew user behavior analytics (revert)'
    command='export HOMEBREW_NO_ANALYTICS=1'
    declare -a profile_files=("$HOME/.bash_profile" "$HOME/.zprofile")
    for profile_file in "${profile_files[@]}"; do
        if grep -q "$command" "${profile_file}" 2>/dev/null; then
            sed -i '' "/$command/d" "$profile_file"
            echo "[$profile_file] Reverted configuration"
        else
            echo "[$profile_file] No need for any action, configuration does not exist"
        fi
    done
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # ---------Disable NET Core CLI telemetry (revert)----------
    # ----------------------------------------------------------
    echo '--- Disable NET Core CLI telemetry (revert)'
    command='export DOTNET_CLI_TELEMETRY_OPTOUT=1'
    declare -a profile_files=("$HOME/.bash_profile" "$HOME/.zprofile")
    for profile_file in "${profile_files[@]}"; do
        if grep -q "$command" "${profile_file}" 2>/dev/null; then
            sed -i '' "/$command/d" "$profile_file"
            echo "[$profile_file] Reverted configuration"
        else
            echo "[$profile_file] No need for any action, configuration does not exist"
        fi
    done
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # --------Disable PowerShell Core telemetry (revert)--------
    # ----------------------------------------------------------
    echo '--- Disable PowerShell Core telemetry (revert)'
    command='export POWERSHELL_TELEMETRY_OPTOUT=1'
    declare -a profile_files=("$HOME/.bash_profile" "$HOME/.zprofile")
    for profile_file in "${profile_files[@]}"; do
        if grep -q "$command" "${profile_file}" 2>/dev/null; then
            sed -i '' "/$command/d" "$profile_file"
            echo "[$profile_file] Reverted configuration"
        else
            echo "[$profile_file] No need for any action, configuration does not exist"
        fi
    done
    # ----------------------------------------------------------
}
