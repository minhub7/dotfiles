# Brew
install_brew(){
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# yazi
install_yazi() {
    brew update
    brew install yazi ffmpegthumbnailer unar jq poppler fd ripgrep fzf zoxide
    brew tap homebrew/cask-fonts && brew install --cask font-symbols-only-nerd-font
}
