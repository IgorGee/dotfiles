#!/usr/bin/env bash

nixProfileDir="/home/igor/.nix-profile"

curl -L https://nixos.org/nix/install | sh
source "$nixProfileDir/etc/profile.d/nix.sh"
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
home-manager switch

systemDDir="$nixProfileDir/etc/systemd/system/*"
for filename in $systemDDir; do
  sudo systemctl link "$(readlink "$filename")"
done
