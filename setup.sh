#!/bin/bash
# Run as normal user (don't use sudo)
# Script to install and configure zsh, vim, and tmux on a fresh system.

# install packages
sudo apt install -y zsh vim tmux guake curl git readelf

# copy dotfiles to home directory
cp -r ./.zshrc ./.vimrc ./.tmux.conf ./dotfiles ~/

# setup zsh in home directory
echo "[+] Changing default shell to zsh"
chsh -s $(which zsh)
# powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo "[+] finished setting up zsh"

# setup vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# set up GDB GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
