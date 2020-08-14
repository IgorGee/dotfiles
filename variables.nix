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
  df = {
    zsh = "${dotfilesPath}/zsh";
    vim = "${dotfilesPath}/vim";
    tmux = "${dotfilesPath}/tmux";
    lf = "${dotfilesPath}/lf";
  };
}
