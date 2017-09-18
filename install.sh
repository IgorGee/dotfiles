#!/bin/bash

PPAs="git-core/ppa hluk/copyq nilarimogard/webupd8 zeal-developers/ppa webupd8team/atom"

devPackages="vim tmux zsh git curl nautilus-dropbox copyq build-essential albert zeal atom"

installPPAs() {
  for i in $PPAs; do
    sudo add-apt-repository -y ppa:$i
  done
  sudo apt update
}

installDevPackages() {
  sudo apt install -y $devPackages
  ln -s /usr/share/applications/albert.desktop ~/.config/autostart/
}

setupGitData() {
  git config --global user.email "goldvekht.igor@gmail.com"
  git config --global user.name "Igor Goldvekht"
}

installChrome() {
  curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb
}

installOhMyZsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

downloadAndInstallDotfiles() {
  git clone https://github.com/igorgee/dotfiles ~/dotfiles
  ~/dotfiles/makesymlinks.sh
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}

installNodejs() {
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  sudo apt install -y nodejs
  mkdir ~/.npm-packages
  echo "prefix=~/.npm-packages" >> ~/.npmrc
}

installMissingDependenciesAndUpgrade() {
  sudo apt -yf install # install missing dependencies
  sudo apt -y full-upgrade
}

fixMouseAcceleration() {
  sudo mkdir /usr/share/X11/xorg.conf.d
  sudo cp ~/dotfiles/90-mouse.conf /usr/share/X11/xorg.conf.d
}

setupAutostartFiles() {
  for file in ~/dotfiles/autostart/*.desktop; do
    cp "$file" ~/.config/autostart/
  done
}

setPowerButtonToSleep() {
  gsettings set org.gnome.settings-daemon.plugins.power button-power suspend
}

installPPAs
installDevPackages
setupGitData
installChrome
installNodejs
installOhMyZsh
downloadAndInstallDotfiles
installMissingDependenciesAndUpgrade
fixMouseAcceleration
setupAutostartFiles

