#!/bin/bash

# import and define
source ./setup/function.sh
declare -a AVAILABLES=("all" "zsh" "starship" "neovim" "tmux" "quit")

# zsh
install_zsh(){
    # if is_installed zsh; then
    #     return
    # fi

    _logInfo "📦⚙️  Install zsh..."
    sudo apt-get update
    sudo apt-get install -y zsh
    sudo chsh -s $(which zsh)

    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote

    if [ -z "$(cat $HOME/.zshrc | grep antidote)" ]; then
        echo "source \${ZDOTDIR:-\$HOME}/.antidote/antidote.zsh" >> $HOME/.zshrc
        echo "antidote load" >> $HOME/.zshrc
    fi

    [[ -f ${ZDOTDIR:-$HOME}/.zsh_plugins.txt ]] || ln -s $(pwd)/zsh/.zsh_plugins.txt ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

    _logInfo "The current shell has been changed to zsh ($SHELL)"
    _logInfo "✅ Done..."
}

# starship
install_starship() {
    if is_installed starship; then
        echo 'eval "$(starship init zsh)"'
        return
    fi

    _logInfo "📦⚙️  Install starship..."
    curl -sS https://starship.rs/install.sh | $SHELL
    mkdir -p ~/.config && ln -s $(pwd)/starship.toml ~/.config/starship.toml

    if [ -z "$(cat $HOME/.zshrc | grep starship)" ]; then
        echo 'eval "$(starship init zsh)"' >> $HOME/.zshrc
    fi

    _logInfo "✅ Done..."
}

# neovim
install_neovim(){
    if is_installed nvim; then
        return
    fi

    _logInfo "📦⚙️  Install neovim..."
    sudo apt-get update
    sudo apt-get install -y snapd
    sudo snap install nvim --classic
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    ln -s $(pwd)/nvchad/custom ~/.config/nvim/lua/custom
    _logInfo "✅ Done..."
}

install_all() {
    install_zsh
    install_starship
    install_neovim
    _logInfo "✅ Done..."
}

print_available() {
    echo "*********************************************************************************"
    echo ""
    echo " Available commands."
    echo ""
    echo "   (1) all      : Setup everything."
    echo "   (2) zsh      : Install zsh with plugin manager."
    echo "   (3) starship : Install starship as a terminal theme."
    echo "   (4) neovim   : Install neovim and set configuration."
    echo "   (5) tmux     : Install Tmux."
    echo "   (6) quit/q   : Quit/Exit."
    echo ""
    echo "*********************************************************************************"
}

# Package installer
process() {
    case $1 in
        "all"|1)
            install_all ;;
        "zsh"|2)
            install_zsh ;;
        "starship"|3)
            install_starship ;;
        "neovim"|4)
            install_neovim ;;
        "tmux"|5) ;;
        "quit"|"q"|6)
            _logInfo "Exits the interactive install process....";
            exit 0 ;;
        *)
            _logInfo "Please choose one of the above options" ;;
    esac
}


print_available
while true; do
    print_available_as_line AVAILABLES
    read -p "Choose one: " response
    process $response
done
