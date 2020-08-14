zshPath=/home/igor/dotfiles/zsh
source $zshPath/lf-icons.zsh
source $zshPath/settings.zsh
source $zshPath/p10k.zsh

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

# gcpr author repo-name
# gcpr author repo-name FETCH_HEAD~3..FETCH_HEAD
function gcpr() {
  local commitRange=$3

  if [[ -z "$commitRange" ]]; then
    git fetch "git@github.com:$1/$2.git" master && git cherry-pick FETCH_HEAD
  else
    git fetch "git@github.com:$1/$2.git" master && git cherry-pick "$commitRange"
  fi
}

# hook that will ls after every pwd change
chpwd() {
  ls
}
