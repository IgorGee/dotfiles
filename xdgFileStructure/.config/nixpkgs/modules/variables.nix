rec {
  username = "igor";
  homeDirectory = "/home/${username}";

  relativeXDGConfigPath = ".config";
  relativeXDGDataPath = ".local/share";
  relativeXDGCachePath = ".cache";
  absoluteXDGConfigPath = "${homeDirectory}/.config";
  absoluteXDGDataPath = "${homeDirectory}/.local/share";
  absoluteXDGCachePath = "${homeDirectory}/.cache";

  nixBinDir = "${homeDirectory}/.nix-profile/bin";

  dotfilesPath = "${homeDirectory}/dotfiles";
  homeManagerModulesPath = "${absoluteXDGConfigPath}/nixpkgs/modules";
  
  df = {
    zsh = "${homeManagerModulesPath}/zsh";
    vim = "${homeManagerModulesPath}/vim";
    tmux = "${homeManagerModulesPath}/tmux";
    lf = "${homeManagerModulesPath}/lf";
  };
}
