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
