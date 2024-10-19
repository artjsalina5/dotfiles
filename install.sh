#!/bin/sh

if [ -z "$USER" ]; then
    USER=$(id -un)
fi

echo >&2 "====================================================================="
echo >&2 " Setting up Codespaces environment"
echo >&2 ""
echo >&2 " USER        $USER"
echo >&2 " HOME        $HOME"
echo >&2 "====================================================================="

# Get the directory where install.sh is located
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

cd $HOME

# Make passwordless sudo work
export SUDO_ASKPASS=/bin/true

# Clean up default bash/zsh config
rm -rf .oh-my-bash
rm -rf .oh-my-zsh

# Copy .vimrc and .font from the directory where the script is run
echo "Copying dotfiles from $SCRIPT_DIR"
cp "$SCRIPT_DIR/.vimrc" $HOME/.vimrc
cp -rf "$SCRIPT_DIR/.font/" $HOME/.local/share/fonts/

# Move the precompiled Vim binary to ~/bin
echo "Moving Vim binary from $SCRIPT_DIR"
mkdir -p $HOME/bin

cp -rf  "$SCRIPT_DIR/bin" $HOME/bin/vim/bin

# Set up an alias for Vim
echo "alias vim='$HOME/bin/vim/bin/vim'" >> ~/.bashrc
source ~/.bashrc

# Install fzf
FZF_VERSION=0.30.0
curl -L https://github.com/junegunn/fzf/releases/download/${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz | tar xzC $HOME/bin

echo >&2 "====================================================================="
echo >&2 " Codespaces environment setup complete!"
echo >&2 "====================================================================="

