#!/bin/bash

# MENU
echo "*********************************************************************************"
echo "*                                  dotfiles                                     *"
echo "*                              Version : 0.0.1                                  *"
echo "*********************************************************************************"

OS=$(uname | tr '[:upper:]' '[:lower:]')
case $OS in
    linux*)
        source ./setup/ubuntu.sh ;;
    darwin*)
        source ./setup/macos.sh ;;
    *) ;;
esac


print_available
while true; do
    echo;
    print_available_as_line "${PACKAGES[@]}"
    read -p "Choose one: " response
    execute $response "${PACKAGES[@]}"
done
