#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc zshrc tmux.conf"

# create dotfiles_old in homedir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
  mv ~/.$file $olddir
  ln -s $dir/$file ~/.$file
done
