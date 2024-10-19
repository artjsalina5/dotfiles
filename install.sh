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

# Install libfuse1, required to run AppImages
sudo apt-get install -y libfuse2

# Download the latest Vim AppImage
curl -L -o ~/bin/vim https://github.com/vim/vim-appimage/releases/download/v9.1.0792/vim.appimage

# Make the AppImage executable
chmod +x ~/bin/vim

# Set up an alias to use Vim easily
echo "alias vim='$HOME/bin/vim'" >> ~/.bashrc
source ~/.bashrc

git clone https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim

