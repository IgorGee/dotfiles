cd "$HOME/dotfiles" || exit
stow -v xdgFileStructure
cd - || exit
