rec {
  username = "igor";
  homeDirectory = "/home/${username}";

  relativeXDGConfigPath = ".config";
  relativeXDGDataPath = ".local/share";
  relativeXDGCachePath = ".cache";
  absoluteXDGConfigPath = "${homeDirectory}/${relativeXDGConfigPath}";
  absoluteXDGDataPath = "${homeDirectory}/${relativeXDGDataPath}";
  absoluteXDGCachePath = "${homeDirectory}/${relativeXDGCachePath}";

  nixBinDir = "${homeDirectory}/.nix-profile/bin";

  dotfilesPath = "${homeDirectory}/dotfiles";
  nixpkgsPath = "${absoluteXDGConfigPath}/nixpkgs";
  homeManagerModulesPath = "${nixpkgsPath}/modules";

  # Dotfiles
  df = {
    zsh = "${homeManagerModulesPath}/zsh";
    vim = "${homeManagerModulesPath}/vim";
    tmux = "${homeManagerModulesPath}/tmux";
    lf = "${homeManagerModulesPath}/lf";
  };
}
