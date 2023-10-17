#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# ####################
# ####  Install  #####
# ####################

# vim
echo "========================"
echo " vim will be installed"
echo "========================"
wget -O /tmp/vim.appimage https://github.com/vim/vim-appimage/releases/download/v9.0.2034/Vim-v9.0.2034.glibc2.29-x86_64.AppImage
sudo chmod +x /tmp/vim.appimage
sudo ln -sf /tmp/vim.appimage /usr/bin/vim
echo ">>> Done"
echo ""

# neovim
echo "=========================="
echo " neovim will be installed"
echo "=========================="
wget -O /tmp/nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo chmod +x /tmp/nvim.appimage
sudo ln -sf /tmp/nvim.appimage /usr/bin/nvim
echo ">>> Done"
echo ""

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


# ##################
# ####  Setup  #####
# ##################
echo "======="
echo " Setup"
echo "======="

# font
echo "copy font... "
if [ ! -d ~/.fonts ]; then
    mkdir -v ~/.fonts
fi
cp -f -v $SCRIPT_DIR/MesloLGS\ NF\ Regular.ttf ~/.fonts/
echo ">>> Done"
echo ""

# vim
echo "setting vim... "
if [ -d ~/.vim/undo ]; then
    rm -rf ~/.vim/undo
fi
if [ -d ~/.vim/plugged ]; then
    rm -rf ~/.vim/plugged
fi
mkdir -p -v ~/.vim/undo
ln -sf $SCRIPT_DIR/vimrc ~/.vimrc
pip3 install neovim pynvim
echo ">>> Done"
echo ""

# neovim
echo "setting neovim... "
if [ -d ~/.local/share/nvim ]; then
    rm -rf ~/.local/share/nvim
fi
if [ -d ~/.config/nvim/undo ]; then
    rm -rf ~/.config/nvim/undo
fi
if [ ! -d ~/.config/nvim ]; then
    mkdir -p -v ~/.config/nvim
fi
ln -sf $SCRIPT_DIR/init.vim ~/.config/nvim/init.vim
echo ">>> Done"
echo ""

# tmux
echo "setting tmux... "
ln -sf $SCRIPT_DIR/tmux.conf ~/.tmux.conf
echo ">>> Done"
echo ""

echo ""
echo "==="
echo "Finish!!"
echo "please set your terminal font as 'MesloLGS NF Regular'"
echo "==="
echo ""
