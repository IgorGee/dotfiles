#!/usr/bin/env bash

baseDirectories="
  .cache
  .config
  .local/share
  programs
  repos
  repos/personal
  repos/contribute
  repos/browse
"

stowSymLinkPreventions="
  .config/coc
  .local/share/vscode
"

directories="
  $baseDirectories
  $stowSymLinkPreventions
"

for directory in $directories; do
  # -p will check to see if the directory doesn't already exist. And if it doesn't, make it.
  mkdir -p "$HOME/$directory"
done
