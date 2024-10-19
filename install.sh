#!/bin/bash

if [ -z "$USER" ]; then
    USER=$(id -un)
fi

echo >&2 "====================================================================="
echo >&2 " Setting up codespaces environment"
echo >&2 ""
echo >&2 " USER        $USER"
echo >&2 " HOME        $HOME"
echo >&2 "====================================================================="

cd $HOME

export SUDO_ASKPASS=/bin/true

rm -rf .oh-my-bash
rm -rf .oh-my-zsh
rm .zshrc

echo >&2 "====================================================================="
echo >&2 " Setting up vim"
echo >&2 "====================================================================="

curl -fsSL https://fnm.vercel.app/install | bash
# activate fnm
source ~/.bashrc
# download and install Node.js
fnm use --install-if-missing 20
sudo apt-get install -y libfuse2
#!/bin/bash

# Variables
VIM_VERSION="v9.1.0792"
VIM_APPIMAGE_URL="https://github.com/vim/vim-appimage/releases/download/${VIM_VERSION}/vim.appimage"
INSTALL_DIR="$HOME/bin"
APPIMAGE_PATH="${INSTALL_DIR}/vim"

# Ensure the installation directory exists
mkdir -p "${INSTALL_DIR}"

# Install dependencies
sudo apt-get update && sudo apt-get install -y libfuse2

curl -L -o "${APPIMAGE_PATH}" "${VIM_APPIMAGE_URL}"

chmod a+x "${APPIMAGE_PATH}"

if [ -f /usr/local/bin/vim ]; then
  sudo rm /usr/local/bin/vim
fi
sudo ln -s "${APPIMAGE_PATH}" /usr/local/bin/vim

git clone https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim


