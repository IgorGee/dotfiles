zshDirPath=$HOME/dotfiles/xdgFileStructure/.config/nixpkgs/modules/zsh
source $zshDirPath/lf-icons.zsh
source $zshDirPath/settings.zsh
source $zshDirPath/p10k.zsh

[[ -f ~/.nix-profile/etc/profile.d/nix.sh ]] && source ~/.nix-profile/etc/profile.d/nix.sh

function gclo() {
  cloneFullUrl() {
    local fullUrl=$1
    local repoName=$2

    if git clone "$fullUrl"; then
      cd "$repoName" || exit
    fi
  }

  cloneShorthand() {
    local author=$1
    local repoName=$2
    local fullUrl="git@github.com:$author/$repoName.git"

    git clone "$fullUrl" && cd "$repoName" || return
  }

  if [[ $1 =~ git@github\.com:(.*)/(.*)\.git ]]; then
    cloneFullUrl "$1" "${BASH_REMATCH[2]}"
  else
    cloneShorthand "$1" "$2"
  fi
}

# hook that will ls after every pwd change (cd ...)
chpwd() {
  ls
}
