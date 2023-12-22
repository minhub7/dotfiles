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
_logError() {
    _log "[ERROR] $@"
    exit 1;
}

# Function to check if a command is installed
is_installed() {
    if command -v $1 &> /dev/null; then
        _logInfo "$1 already installed"
        return 0
    else
        return 1
    fi
}

print_available_as_line() {
    local count=1
    echo; echo -n "[ "
    for item in ${AVAILABLES[@]}; do
        echo -n "($((count++))) $item / "
    done
    echo "]"
}
