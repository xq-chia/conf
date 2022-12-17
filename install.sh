#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt upgrade
sudo apt install zsh git tmux neovim nodejs npm ripgrep fd-find curl

sudo npm install -g tree-sitter-cli
ln -s $(which fdfind) ~/.local/bin/fd

cd .oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
cd ~

git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh Hack
cd ~
rm -rf nerd-fonts

dconf write /org/gnome/desktop/input-sources/xkb-options "['ctrl:swapcaps_hyper']"

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/xq-chia/conf /tmp/conf
cd /tmp/conf
mv ctags tmux vim zsh config.lua modules.lua ~/.config
rm ~/.zshrc
ln -s ~/.config/zsh/.zshrc ~/.zshrc
rm ~/.config/nvim/config.lua ~/.config/modules.lua
ln -s ~/.config/config.lua ~/.config/nvim/config.lua
ln -s ~/.config/modules.lua ~/.config/nvim/modules.lua
