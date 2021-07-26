zshDirPath=$HOME/dotfiles/xdgFileStructure/.config/nixpkgs/modules/zsh
source $zshDirPath/post-compinit-common.zsh

export PATH="$PATH:/home/igor/.local/share/npm/bin"

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
  # Note: $2 is the directory within the container of $1 that you wish to backup.
  # If there are multiple directories you want to back up, you need to run this command for each of them
  docker run --rm -v /tmp:/backup --volumes-from "$1" debian:jessie tar -czvf /backup/backup.tar.gz "${@:2}"
}

# restore files from /tmp/backup.tar.gz into a docker volume
function docker-volume-restore-compressed() {
  # Note: For $2, you should remove leading slashes
  # Also, the backup.tar.gz file should be in your /tmp
  docker run --rm -v /tmp:/backup --volumes-from "$1" debian:jessie tar -xzvf /backup/backup.tar.gz "${@:2}"
  echo "Double checking files..."
  docker run --rm -v /tmp:/backup --volumes-from "$1" debian:jessie ls -lh "${@:2}"
}
