#!/bin/bash
# Run as normal user (don't use sudo)
# Script to install and configure zsh, vim, and tmux on a fresh system.

# updates
sudo apt update
sudo apt upgrade

# install packages
sudo apt install -y zsh vim tmux guake curl git binutils xclip flameshot
pip3 install pwn

# setup zsh in home directory
echo "[+] Changing default shell to zsh"
chsh -s $(which zsh)

# ohmyzsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions)
sh -c "$(git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting)

# powerlevel12k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo "[+] Zsh setup done!"

# setup vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "[+] Vim setup done!"

# setup tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "[+] Tmux setup done!"

# set up GDB GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
echo "[+] GDB GEF setup done!"

# copy dotfiles to home directory
cp -r ./.zshrc ./.vimrc ./.tmux.conf ./dotfiles ~/
echo "[+] Copied dotfiles to home directory!"

# generate ssh key 
ssh-keygen -t ed25519 -C "jnguyensac@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# change password
passwd
