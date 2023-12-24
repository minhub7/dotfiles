#!/bin/bash

# Logging
_log() {
    echo "$@"  # [$(date '+%Y.%m.%d-%H:%M:%S (%a)')]
}
_logInfo() {
    _log "[INFO] $@"
}
_logDebug() {
    _log "[DEBUG] $@"
}
_logWarning() {
    _log "[WARNING] $@"
}
_logError() {
    _log "[ERROR] $@"
    exit 1;
}

# Function to check if a command is installed
isInstalled() {
    if command -v $1 &> /dev/null; then
        _logInfo "$1 already installed"
        return 0
    else
        return 1
    fi
}

# Print available packages at one line.
print_available_as_line() {
    local packages=("$@")

    echo -n "[ "
    for ((i=0; i < ${#packages[@]}-1; i++)); do
        echo -n "($((i+1))) ${packages[$i]} / "
    done
    echo "($((i+1))) ${packages[$i]} ]"
}


# Installer for packages
execute() {
    local choose="$1"
    shift
    local packages=("$@")

    case $choose in
        "quit"|"q"|"${#packages[@]}")
            _logInfo "Exits the interactive install process...."
            exit 0
            ;;
        *)
            if [[ "$choose" =~ ^[0-9]+$ ]]; then
                selected=install_"${packages[$choose-1]}"
            else
                selected=install_"$choose"
            fi

            if type "$selected" &> /dev/null; then
                _logInfo "📦 $selected..."
                $selected
                _logInfo "✅ Done"
            else
                _logWarning "Please choose one of the above options"
            fi
            ;;
    esac
}
