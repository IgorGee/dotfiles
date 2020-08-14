#!/usr/bin/env zsh

curl -LO https://github.com/EliverLara/Sweet/releases/download/v1.10.5/Sweet-Dark.zip
x Sweet-Dark.zip
mv Sweet-Dark/Sweet-Dark "$HOME/dotfiles/xdgFileStructure/.local/share/theme/"
rm Sweet-Dark.zip

cd "$HOME/programs/yay" || exit
makepkg -si
yay -Syu libxft-bgra
# Might be necessary
# gpg --keyserver "hkp://ipv4.pool.sks-keyservers.net:11371" --recv-keys 4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E
