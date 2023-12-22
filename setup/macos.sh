#!/bin/bash

# import and define
source ./setup/function.sh
declare -a AVAILABLES=("all" "brew" "zsh" "starship" "neovim" "tmux" "quit")

# Brew
install_brew(){
    if is_installed brew; then
        return
    fi

    _logInfo "📦⚙️  Install brew..."
    $SHELL -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    _logInfo "✅ Done"
}

# zsh
install_zsh(){
    if is_installed zsh; then
        return
    fi

    _logInfo "📦⚙️  Install zsh..."
    brew install zsh
    sudo chsh -s $(which zsh)
    brew install antidote

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
        return
    fi

    _logInfo "📦⚙️  Install zsh..."
    brew install starship
    _logInfo "✅ Done"
}

# neovim
install_neovim(){
    if is_installed nvim; then
        return
    fi

    _logInfo "📦⚙️  Install neovim..."
    brew install neovim
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    ln -s $(pwd)/nvchad/custom ~/.config/nvim/lua/custom
    _logInfo "✅ Done..."
}

# yazi
install_yazi() {
    if is_installed yazi; then
        return
    fi

    brew update
    brew install yazi ffmpegthumbnailer unar jq poppler fd ripgrep fzf zoxide
    brew tap homebrew/cask-fonts && brew install --cask font-symbols-only-nerd-font
    _logInfo "✅ Done"
}


print_available() {
    echo "*********************************************************************************"
    echo ""
    echo " Available commands."
    echo ""
    echo "   (1) all      : Setup everything."
    echo "   (2) brew     : Install Brewfile Dependencies & Applications."
    echo "   (3) zsh      : Install zshell."
    echo "   (4) starship : Install starship."
    echo "   (5) neovim   : Install neovim and set some configuration."
    echo "   (6) tmux     : Install Tmux."
    echo "   (7) quit/q   : Quit/Exit."
    echo ""
    echo "*********************************************************************************"
}


# Package installer
process() {
    case $1 in
        "all"|1)
            install_brew
            install_zsh
            install_yazi
            install_tmux
            ;;
        "brew"|2)
            install_brew ;;
        "zsh"|3)
            install_zsh ;;
        "neovim"|4)
            install_neovim ;;
        "tmux"|5)
            install_tmux ;;
        "quit"|"q"|6)
            echo "Exits the interactive install process....";
            exit 0 ;;
        *)
            echo "Please choose one of the above options" ;;
    esac
}

print_available
while true; do
    print_available_as_line AVAILABLES
    read -p "Choose one: " response
    process $response
done
