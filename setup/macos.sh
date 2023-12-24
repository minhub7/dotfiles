#!/bin/bash

# import functions
source ./setup/function.sh
declare -a PACKAGES=(
    "all"
    "brew"
    "zsh"
    "starship"
    "neovim"
    "yazi"
    "tmux"
    "quit"
)


# Brew
install_brew() {
    if isInstalled brew; then
        return
    fi

    $SHELL -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# zsh
install_zsh() {
    if isInstalled zsh; then
        return
    fi

    brew install zsh
    sudo chsh -s $(which zsh)
    brew install antidote

    if [ -z "$(cat $HOME/.zshrc | grep antidote)" ]; then
        echo "source \$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh" >> $HOME/.zshrc
        echo "antidote load" >> $HOME/.zshrc
        echo "autoload -Uz promptinit && promptinit" >> $HOME/.zshrc
    fi

    [[ -f ${ZDOTDIR:-$HOME}/.zsh_plugins.txt ]] || ln -s $(pwd)/zsh/.zsh_plugins.txt ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

    _logInfo "The current shell has been changed to zsh ($SHELL)"
}

# starship
install_starship() {
    if isInstalled starship; then
        return
    fi

    brew install starship
    mkdir -p ~/.config && ln -s $(pwd)/starship.toml ~/.config/starship.toml

    if [ -z "$(cat $HOME/.zshrc | grep starship)" ]; then
        echo 'eval "$(starship init zsh)"' >> $HOME/.zshrc
    fi

}

# neovim
install_neovim() {
    if isInstalled nvim; then
        return
    fi

    brew install neovim

    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    ln -s $(pwd)/nvchad/custom ~/.config/nvim/lua/custom
}

# yazi
install_yazi() {
    if isInstalled yazi; then
        return
    fi

    brew update
    brew install yazi ffmpegthumbnailer unar jq poppler fd ripgrep fzf zoxide
    brew tap homebrew/cask-fonts && brew install --cask font-symbols-only-nerd-font

    [[ -d ~/.config/yazi ]] || ln -s $(pwd)/yazi ~/.config/yazi

    if [ -z $EDITOR ]; then
        echo "export EDITOR=vim" >> $HOME/.zshrc
    fi

    if [ -z "$(cat $HOME/.zshrc | grep fzf)" ]; then
        echo "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh" >> $HOME/.zshrc
    fi
}

# Tmux
install_tmux() {
    if isInstalled tmux; then
        return
    fi

    brew install tmux

    [[ -f $HOME/.tmux.conf ]] || ln -s $(pwd)/tmux/.tmux.conf $HOME/.tmux.conf
}

# Define install functions
install_all() {
    install_brew
    install_zsh
    install_starship
    install_neovim
    install_yazi
    install_tmux
}

print_available() {
    echo "*********************************************************************************"
    echo ""
    echo " Available commands."
    echo ""
    echo "   (1) all      : Setup everything."
    echo "   (2) brew     : Install Brewfile Dependencies & Applications."
    echo "   (3) zsh      : Install zshell."
    echo "   (4) starship : Install starship as a prompt themes."
    echo "   (5) neovim   : Install neovim and set some configuration."
    echo "   (6) yazi     : Install yazi as a file explorer."
    echo "   (7) tmux     : Install Tmux."
    echo "   (8) quit/q   : Quit/Exit."
    echo ""
    echo "*********************************************************************************"
}
