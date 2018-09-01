#!/bin/bash

PPAs="git-core/ppa hluk/copyq nilarimogard/webupd8 zeal-developers/ppa qbittorrent-team/qbittorrent-stable paulo-miguel-dias/pkppa"

devPackages="vim tmux zsh git build-essential docker-ce"

desktopPackages="code nautilus-dropbox copyq albert zeal qbittorrent vlc spotify-client"

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
}

installDesktopPackages() {
  prepareSpotify() {
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  }

  prepareVsCode() {
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  }

  prepareSpotify
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
  ~/dotfiles/makesymlinks.sh
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}

installNodejs() {
  N_PREFIX=~/.n
  curl -L https://git.io/n-install | bash
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

