#!/bin/bash

# Ensure user and home variables are set
if [ -z "$USER" ]; then
    USER=$(id -un)
fi

echo "====================================================================="
echo " Setting up Codespaces environment"
echo ""
echo " USER        $USER"
echo " HOME        $HOME"
echo "====================================================================="

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
cd $HOME

# Make passwordless sudo work
export SUDO_ASKPASS=/bin/true

rm -rf .oh-my-bash
rm -rf .oh-my-zsh
rm .zshrc


echo "Copying dotfiles from $SCRIPT_DIR"
cp "$SCRIPT_DIR/.vimrc" $HOME/.vimrc
cp -rf "$SCRIPT_DIR/.font/" $HOME/.font/# Install fzf

FZF_VERSION=0.30.0
curl -L https://github.com/junegunn/fzf/releases/download/${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz | tar xzC $HOME/bin

# Install Vim AppImage and extract it
VIM_VERSION=v9.1.0792
mkdir -p $HOME/bin
wget -O /tmp/vim.appimage https://github.com/vim/vim-appimage/releases/download/${VIM_VERSION}/Vim-${VIM_VERSION}.glibc2.29-x86_64.AppImage
chmod +x /tmp/vim.appimage

# Extract AppImage
/tmp/vim.appimage --appimage-extract

# Move extracted binary to ~/bin
mkdir -p $HOME/bin
mv squashfs-root/usr/bin/vim $HOME/bin/vim

# Clean up extracted files
rm -rf /tmp/squashfs-rootsource ~/.bashrc

git clone https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim

