#!/bin/sh
mkdir -p ~/.cache/dein
cp -T -r ./config ~/.config
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/dein_installer.sh
sh ~/dein_installer.sh ~/.cache/dein

mkdir -p = ~/.config/coc/extensions
