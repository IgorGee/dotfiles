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

function dockerTag() {
  local imageName=$1
  local version=$2
  docker tag "$imageName" "docker.geenethlab/$imageName:v$version"
  docker build -t registry.gitlab.com/goldvekht.igor/$imageName:v$version .
}

function dockerTagLatest() {
  local imageName=$1
  docker tag "$imageName" "docker.geenethlab/$imageName"
  docker build -t registry.gitlab.com/goldvekht.igor/$imageName .
}


function dockerPush() {
  local imageName=$1
  docker push registry.gitlab.com/goldvekht.igor/$imageName
}

function setGitPushUrls() {
  function getRepoName() {
    basename -s .git `git config --get remote.origin.url`
  }

  # Reset
  git remote set-url --delete --push origin "$(git remote get-url --push origin)"
  git remote set-url --delete --push origin ssh://git@gitea.geenethlab:2222/IgorGee/"$(getRepoName)".git # Will log error if DNE

  # Add
  git remote set-url --add --push origin "$(git remote get-url --push origin)"
  git remote set-url --add --push origin ssh://git@gitea.geenethlab:2222/IgorGee/"$(getRepoName)".git # 2222 is a custom port configuration defined in nginx-ingress. ingress is only meant for http, so we needed to manually define this
}

# hook that will ls after every pwd change (cd ...)
chpwd() {
  ls
}
