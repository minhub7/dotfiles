#!/bin/bash

# Logging
_log() {
    echo "[ $(date '+%Y.%m.%d / %H:%M:%S (%a)') ] $@"
}
_logInfo() {
    _log "[INFO] $@"
}
_logDebug() {
    _log "[Debug] $@"
}

# Function to check if a command is installed
is_installed() {
    if command -v $1 &> /dev/null; then
        return 0
    else
        return 1
    fi
}

OS=$(uname | tr '[:upper:]' '[:lower:]')
KERNEL=$(uname -r | tr '[:upper:]' '[:lower:]')
MACH=$(uname -m | tr '[:upper:]' '[:lower:]')

echo $OS

case $OS in
    linux*)
        echo "This OS is linux"
        ;;
    darwin*)
        echo "This OS is macos" ;;
    *) ;;
esac

if is_installed poetry; then
    echo "poetry is installed"
else
    echo "Nah..."
fi
