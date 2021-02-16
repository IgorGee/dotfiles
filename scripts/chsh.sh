#!/usr/bin/env bash

sudo echo $(which zsh) >> /etc/shells
sudo chsh -s $(which zsh)
chsh -s $(which zsh)
vim $HOME/.ssh/id_rsa
