#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# ####################
# ####  Install  #####
# ####################

# curl
echo "========================"
echo " curl will be installed"
echo "========================"
sudo apt install curl -y --no-install-recommends
echo ">>> Done"
echo ""

# wget
echo "========================"
echo " wget will be installed"
echo "========================"
sudo apt install wget -y --no-install-recommends
echo ">>> Done"
echo ""

# font
echo "=============================="
echo " nerd-fonts will be installed"
echo "=============================="
if [ ! -d ~/.local/share/fonts ]; then
  mkdir -p -v ~/.local/share/fonts
fi
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf
echo ">>> Done"
echo ""

# vim
echo "======================="
echo " vim will be installed"
echo "======================="
sudo apt install vim-gtk -y --no-install-recommends
echo ">>> Done"
echo ""

# neovim
if [ $(arch) = x86_64 ]; then
  echo "=========================="
  echo " neovim will be installed"
  echo "=========================="
  sudo wget -O /opt/nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
  sudo chmod +x /opt/nvim.appimage
  sudo ln -sf /opt/nvim.appimage /usr/bin/nvim
  sudo ln -sf /usr/bin/nvim /usr/bin/vim
  echo ">>> Done"
  echo ""
fi

# tmux
echo "=========================="
echo " tmux will be installed"
echo "=========================="
sudo apt install tmux -y --no-install-recommends
echo ">>> Done"
echo ""

# xsel
echo "========================"
echo " xsel will be installed"
echo "========================"
sudo apt install xsel -y --no-install-recommends
echo ">>> Done"
echo ""

# python3
echo "=================================="
echo " python3 & pip3 will be installed"
echo "=================================="
sudo apt install python3 python3-pip -y --no-install-recommends
echo ">>> Done"
echo ""

# fuse
echo "========================"
echo " fuse will be installed"
echo "========================"
sudo apt install fuse -y --no-install-recommends
echo ">>> Done"
echo ""

# libfuse2
echo "============================"
echo " libfuse2 will be installed"
echo "============================"
sudo apt install libfuse2 -y --no-install-recommends
echo ">>> Done"
echo ""


# ##################
# ####  Setup  #####
# ##################
echo "======="
echo " Setup"
echo "======="

# vim/neovim
echo "setting vim/neovim... "
if [ -d ~/.vim/undo ]; then
  rm -rf ~/.vim/undo
fi
if [ ! -d ~/.vim/undo ]; then
  mkdir -pv ~/.vim/undo
fi
if [ -d ~/.vim/plugged ]; then
  rm -rf ~/.vim/plugged
fi
if [ -d ~/.config/nvim/undo ]; then
  rm -rf ~/.config/nvim/undo
fi
if [ ! -d ~/.config/nvim ]; then
  mkdir -pv ~/.config/nvim
fi
ln -sf $SCRIPT_DIR/vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/init.vim ~/.config/nvim/init.vim
pip3 install pynvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall --sync' -c qa
if [ $(arch) = x86_64 ]; then
  vim -c 'UpdateRemotePlugins' -c qa
fi
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

echo ""
echo "==="
echo "Finish!!"
echo "please set your terminal font as 'Hack Nerd Font Regular'"
echo "==="
echo ""
