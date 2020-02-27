#!/bin/bash

devPPAs="git-core/ppa"
desktopPPAs="hluk/copyq nilarimogard/webupd8 zeal-developers/ppa qbittorrent-team/qbittorrent-stable paulo-miguel-dias/pkppa"

devPackages="vim tmux zsh git build-essential docker-ce python3-pip"
desktopPackages="code nautilus-dropbox copyq albert zeal qbittorrent vlc"

prepareDocker() {
  sudo apt install -y curl
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
}

installDevPPAs() {
  for i in $devPPAs; do
    sudo add-apt-repository -y ppa:$i
  done
}

installDesktopPPAs() {
  for i in $desktopPPAs; do
    sudo add-apt-repository -y ppa:$i
  done
}

installDevPackages() {
  installDevPPAs
  sudo apt update
  sudo apt install -y $devPackages
  sudo usermod -a -G docker $USER
}

installDesktopPackages() {
  prepareVsCode() {
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  }

  installChrome() {
    curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb
  }

  prepareVsCode
  installDevPPAs
  sudo apt update
  sudo apt install -y $desktopPackages
  installChrome
}

setupGitData() {
  git config --global user.email "goldvekht.igor@gmail.com"
  git config --global user.name "Igor Goldvekht"
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

installYarn() {
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt install --no-install-recommends yarn
}

installNodejs() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
  nvm install node
  nvm use node
  installYarn
}

installMissingDependenciesAndUpgrade() {
  sudo apt -yf install # install missing dependencies
  sudo apt -y full-upgrade
}

prepareDocker
installDevPackages
# installDesktopPackages
setupGitData
installNodejs
installOhMyZsh
downloadAndInstallDotfiles
installMissingDependenciesAndUpgrade

