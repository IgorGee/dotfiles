#!/usr/bin/env zsh

XDGDataDir="$HOME/dotfiles/xdgFileStructure/.local/share/""
themesDir="$XDGDataDir/themes"
iconDir="$XDGDataDir/icons"

curl -LO https://github.com/EliverLara/Sweet/releases/download/v1.10.5/Sweet-Dark.zip
unzip Sweet-Dark.zip -d "$themesDir"
rm Sweet-Dark.zip

extract "$HOME/dotfiles/misc/volantes_cursors.tar.gz"
mv volantes_cursors "$iconDir"

source prepareXdg.sh

cd "$HOME/programs/yay" || exit
makepkg -si
yay -Syu libxft-bgra
# Might be necessary
# gpg --keyserver "hkp://ipv4.pool.sks-keyservers.net:11371" --recv-keys 4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E

cd "$HOME/programs/st" || exit
sudo make install

cd "$HOME/repos/personal" || exit
git clone --recursive git@github.com:IgorGee/pdotfiles.git
cd pdotfiles || exit
./downloadRepos.zsh
