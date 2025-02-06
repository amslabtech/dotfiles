#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

echo "==============="
echo " Installations"
echo "==============="
echo "install prerequisites..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends \
  curl \
  wget \
  vim-gtk \
  tmux \
  fuse \
  libfuse2 \
  xsel \
  clangd \
  python3 \
  python3-pip \
  nodejs \
  npm \
  ripgrep
pip3 install jedi-language-server pynvim
sudo npm install -y -g n
sudo n stable

# Neovim
if [[ $(arch) == "x86_64" ]]; then
  sudo wget -vO /opt/nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  sudo chmod +x /opt/nvim.appimage
  sudo ln -sf /opt/nvim.appimage /usr/bin/nvim
elif [[ $(arch) == "aarch64" ]]; then
  # Choose between appimage or build
  APP_TYPE="appimage"
  if [[ ${APP_TYPE} == "appimage" ]]; then
    sudo wget -vO /opt/nvim.appimage https://github.com/matsuu/neovim-aarch64-appimage/releases/download/v0.10.1/nvim-v0.10.1-aarch64.appimage
    sudo chmod +x /opt/nvim.appimage
    sudo ln -sf /opt/nvim.appimage /usr/local/bin/nvim
  elif [[ ${APP_TYPE} == "build" ]]; then
    sudo apt-get update && sudo apt-get install -y --no-install-recommends \
      unzip \
      gettext \
      cmake \
      ninja-build \
      build-essential \
      ca-certificates
    git clone -b stable --single-branch --depth 1 https://github.com/neovim/neovim ~/neovim
    cd ~/neovim
    make appimage
    sudo make install
    rm -rf ~/neovim
  fi
fi
if [[ -e /usr/bin/nvim ]]; then
  sudo ln -sf /usr/bin/nvim /usr/bin/vim
fi

echo "=============================="
echo " nerd-fonts will be installed"
echo "=============================="
if [ ! -d ~/.local/share/fonts ]; then
  mkdir -p -v ~/.local/share/fonts
fi
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf
echo ">>> Done"
echo ""

echo "======="
echo " Setup"
echo "======="

echo "setting vim/neovim... "
# vim
if [ -d ~/.vim/undo ]; then
  rm -rf ~/.vim/undo
fi
if [ ! -d ~/.vim/undo ]; then
  mkdir -pv ~/.vim/undo
fi
if [ -d ~/.vim/plugged ]; then
  rm -rf ~/.vim/plugged
fi
ln -sf $SCRIPT_DIR/vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/configs/basic-settings.vim ~/.vim/basic-settings.vim
ln -sf $SCRIPT_DIR/configs/plugin-settings.vim ~/.vim/plugin-settings.vim
ln -sf $SCRIPT_DIR/configs/plugins.vim ~/.vim/plugins.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# neovim
if [[ -d ~/.local/share/nvim/plugged ]]; then
  rm -rf ~/.local/share/nvim/plugged
fi
if [[ -d ~/.config/nvim/undo ]]; then
  rm -rf ~/.config/nvim/undo
fi
if [[ -d ~/.config/coc ]]; then
  rm -rf ~/.config/coc
fi
if [[ ! -d ~/.config/nvim ]]; then
  mkdir -pv ~/.config/nvim
fi
ln -sf $SCRIPT_DIR/init.vim ~/.config/nvim/init.vim
ln -sf $SCRIPT_DIR/configs/coc-settings.json ~/.config/nvim/coc-settings.json
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ">>> Done"
echo ""

# tmux
echo "setting tmux... "
ln -sf $SCRIPT_DIR/tmux.conf ~/.tmux.conf
if [ -d ~/.tmux ]; then
  rm -rf ~/.tmux
fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
echo ">>> Done"
echo ""

# git
echo "setting git... "
if [ ! -d ~/.config/git ]; then
  mkdir -p ~/.config/git
fi
cat $SCRIPT_DIR/gitignore >> ~/.config/git/ignore
cat $SCRIPT_DIR/gitconfig >> ~/.gitconfig
echo ">>> Done"
echo ""

# bash_aliases
echo "setting bash_aliases... "
echo "if [ -f $SCRIPT_DIR/configs/ros1_aliases.bash ]; then source $SCRIPT_DIR/configs/ros1_aliases.bash; fi" >> ~/.bash_aliases
echo ">>> Done"
echo ""

echo ""
echo "==="
echo "Finish!!"
echo "please set your terminal font as 'Hack Nerd Font Regular'"
echo "==="
echo ""
