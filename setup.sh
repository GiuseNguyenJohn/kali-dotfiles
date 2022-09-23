#!/bin/bash
# Script to install and configure zsh, vim, and tmux on a fresh system.

check_last_command (){
    if ["$?" -ne 0]; then
        echo "ERROR: '${1}' Failed!"
    fi
}
# install packages
apt install -y zsh vim tmux

# setup zsh in home directory
chsh -s $(which zsh)
check_last_command "changing shell to zsh"
echo "[+] finished setting up zsh"

# dracula theme
