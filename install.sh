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

# Change to home directory
cd $HOME

# Remove oh-my-bash and oh-my-zsh if present
rm -rf .oh-my-bash
rm -rf .oh-my-zsh
rm .zshrc

echo "====================================================================="
echo " Setting up Vim"
echo "====================================================================="

cp .vimrc $HOME/.vimrc
cp -rf .font/ $HOME/.font/

# Install libfuse1, required to run AppImages
sudo apt-get update
sudo apt-get install -y libfuse1

# Ensure bin directory exists
mkdir -p $HOME/bin
VIM_VERSION=v9.1.0792
wget -O /tmp/vim.appimage https://github.com/vim/vim-appimage/releases/download/${VIM_VERSION}/Vim-${VIM_VERSION}.glibc2.29-x86_64.AppImage
chmod +x /tmp/vim.appimage
mv /tmp/vim.appimage $HOME/bin/vim

echo "alias vim='$HOME/bin/vim'" >> ~/.bashrc

source ~/.bashrc

git clone https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim

