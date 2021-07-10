zshDirPath=$HOME/dotfiles/xdgFileStructure/.config/nixpkgs/modules/zsh
source $zshDirPath/lf-icons.zsh
source $zshDirPath/settings.zsh
source $zshDirPath/p10k.zsh

[[ -f ~/.nix-profile/etc/profile.d/nix.sh ]] && source ~/.nix-profile/etc/profile.d/nix.sh

export PATH="$PATH:/home/igor/.local/share/npm/bin"

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

function http2ssh() {
  local httpUrl
  httpUrl="$(git remote get-url origin)"

  if [[ $httpUrl =~ https://github\.com/(.*)/(.*)\.git ]]; then
    local author="${match[1]}"
    local repoName="${match[2]}"
    git remote set-url origin "git@github.com:$author/$repoName.git"
  fi
}

function dcli() {
  local containerName
  containerName="$1"
  docker exec -it "$containerName" /bin/bash
}

# Backing up and Restoring Docker Volumes
# https://stackoverflow.com/questions/21597463/how-to-port-data-only-volumes-from-one-host-to-another/23778599
# backup files from a docker volume into /tmp/backup.tar.gz
function docker-volume-backup-compressed() {
  docker run --rm -v /tmp:/backup --volumes-from "$1" debian:jessie tar -czvf /backup/backup.tar.gz "${@:2}"
}

# restore files from /tmp/backup.tar.gz into a docker volume
function docker-volume-restore-compressed() {
  docker run --rm -v /tmp:/backup --volumes-from "$1" debian:jessie tar -xzvf /backup/backup.tar.gz "${@:2}"
  echo "Double checking files..."
  docker run --rm -v /tmp:/backup --volumes-from "$1" debian:jessie ls -lh "${@:2}"
}

# hook that will ls after every pwd change (cd ...)
chpwd() {
  ls
}
