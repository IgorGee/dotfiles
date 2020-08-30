curl -L https://nixos.org/nix/install | sh
source /home/igor/.nix-profile/etc/profile.d/nix.sh
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
home-manager switch
