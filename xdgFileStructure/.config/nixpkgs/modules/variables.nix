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

  reposDir = "${homeDirectory}/repos";
  dotfilesPath = "${homeDirectory}/dotfiles";
  pDotfilesPath = "${homeDirectory}/repos/personal/pdotfiles";
  pAliasesPath = "${pDotfilesPath}/pAliases.nix";
  nixpkgsPath = "${absoluteXDGConfigPath}/nixpkgs";
  homeManagerModulesPath = "${nixpkgsPath}/modules";
  xdgFileStructurePath = "${dotfilesPath}/xdgFileStructure";
  xdgConfig = "${xdgFileStructurePath}/${relativeXDGConfigPath}";

  # Dotfiles
  df = {
    zsh = "${homeManagerModulesPath}/zsh";
    vim = "${homeManagerModulesPath}/vim";
    tmux = "${homeManagerModulesPath}/tmux";
    lf = "${homeManagerModulesPath}/lf";
  };
}
