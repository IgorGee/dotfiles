zshDirPath=$HOME/dotfiles/xdgFileStructure/.config/nixpkgs/modules/zsh
source $zshDirPath/post-compinit-common.zsh

command -v flux >/dev/null && . <(flux completion zsh) && compdef _flux flux