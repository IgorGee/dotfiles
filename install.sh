#!/bin/bash

PPAs="git-core/ppa hluk/copyq nilarimogard/webupd8 zeal-developers/ppa qbittorrent-team/qbittorrent-stable paulo-miguel-dias/pkppa"

devPackages="vim tmux zsh git build-essential docker-ce python3-pip"

desktopPackages="code nautilus-dropbox copyq albert zeal qbittorrent vlc"

installPPAs() {
  prepareDocker() {
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  }

  sudo apt install -y curl
  prepareDocker
  for i in $PPAs; do
    sudo add-apt-repository -y ppa:$i
  done
  sudo apt update
}

installDevPackages() {
  sudo apt install -y $devPackages
  sudo usermod -a -G docker $USER
}

installDesktopPackages() {
  prepareVsCode() {
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  }

  prepareVsCode
  sudo apt update
  sudo apt install -y $desktopPackages
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
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  ~/dotfiles/makesymlinks.sh
  vim +PluginInstall +qall
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
}

installNodejs() {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
  nvm install node
  nvm use node
}

installMissingDependenciesAndUpgrade() {
  sudo apt -yf install # install missing dependencies
  sudo apt -y full-upgrade
}

installPPAs
installDevPackages
installDesktopPackages
setupGitData
installChrome
installNodejs
installOhMyZsh
downloadAndInstallDotfiles
installMissingDependenciesAndUpgrade

