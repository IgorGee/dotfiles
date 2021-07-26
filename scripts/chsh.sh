#!/usr/bin/env bash

echo $(which zsh) | sudo tee -a /etc/shells
sudo chsh -s $(which zsh)
chsh -s $(which zsh)
