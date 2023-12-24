#!/bin/bash

# import functions
source ./setup/function.sh
declare -a PACKAGES=(
    "all"
    "zsh"  #done
    "starship"  #done
    "neovim"  #done
    "yazi"  #done
    "tmux"  #done
    "quit"
)

# zsh
install_zsh(){
    if isInstalled zsh; then
        return
    fi

    sudo apt-get update
    sudo apt-get install -y zsh
    sudo chsh -s $(which zsh)

    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote

    if [ -z "$(cat $HOME/.zshrc | grep antidote)" ]; then
        echo "source \${ZDOTDIR:-\$HOME}/.antidote/antidote.zsh" >> $HOME/.zshrc
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

    curl -sS https://starship.rs/install.sh | $SHELL
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

    sudo apt-get update
    sudo apt-get install -y snapd
    sudo snap install nvim --classic

    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    ln -s $(pwd)/nvchad/custom ~/.config/nvim/lua/custom
}

# yazi
install_yazi() {
    if isInstalled yazi; then
        return
    fi

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    cargo install --locked yazi-fm

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

    sudo apt-get install tmux

    [[ -f $HOME/.tmux.conf ]] || ln -s $(pwd)/tmux/.tmux.conf $HOME/.tmux.conf
}


install_all() {
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
    echo "   (2) zsh      : Install zsh with plugin manager."
    echo "   (3) starship : Install starship as a prompt themes."
    echo "   (4) neovim   : Install neovim and set configuration."
    echo "   (5) yazi     : Install yazi as a file explorer."
    echo "   (6) tmux     : Install Tmux."
    echo "   (7) quit/q   : Quit/Exit."
    echo ""
    echo "*********************************************************************************"
}
