#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# ####################
# ####  Install  #####
# ####################

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

# neovim
echo "=========================="
echo " neovim will be installed"
echo "=========================="
sudo wget -O /opt/nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo chmod +x /opt/nvim.appimage
sudo ln -sf /opt/nvim.appimage /usr/bin/vim
sudo ln -sf /opt/nvim.appimage /usr/bin/nvim
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

# libfuse2
os_version=$(cat /etc/os-release | grep VERSION_ID | cut -d '"' -f 2)
if [ $os_version == "22.04" ]; then
    echo "============================"
    echo " libfuse2 will be installed"
    echo "============================"
    sudo apt install libfuse2 -y --no-install-recommends
    echo ">>> Done"
    echo ""
fi


# ##################
# ####  Setup  #####
# ##################
echo "======="
echo " Setup"
echo "======="

# neovim
echo "setting neovim... "
if [ -d ~/.local/share/nvim/plugged ]; then
    rm -rf ~/.local/share/nvim/plugged
fi
if [ -d ~/.config/nvim/undo ]; then
    rm -rf ~/.config/nvim/undo
fi
if [ ! -d ~/.config/nvim ]; then
    mkdir -p -v ~/.config/nvim
fi
ln -sf $SCRIPT_DIR/init.vim ~/.config/nvim/init.vim
pip3 install pynvim
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
