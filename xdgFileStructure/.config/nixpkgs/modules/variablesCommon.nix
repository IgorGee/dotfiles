rec {
  username = "igor";
  homeDirectory = "/home/${username}";

  relativeXDGConfigDirPath = ".config";
  relativeXDGDataDirPath = ".local/share";
  relativeXDGCacheDirPath = ".cache";
  absoluteXDGConfigDirPath = "${homeDirectory}/${relativeXDGConfigDirPath}";
  absoluteXDGDataDirPath = "${homeDirectory}/${relativeXDGDataDirPath}";
  absoluteXDGCacheDirPath = "${homeDirectory}/${relativeXDGCacheDirPath}";

  nixBinDir = "${homeDirectory}/.nix-profile/bin";

  dotfilesDirPath = "${homeDirectory}/dotfiles";
  nixpkgsDirPath = "${absoluteXDGConfigDirPath}/nixpkgs";
  homeManagerModulesDirPath = "${nixpkgsDirPath}/modules";
  xdgFileStructureDirPath = "${dotfilesDirPath}/xdgFileStructure";
  xdgConfigDirPath = "${xdgFileStructureDirPath}/${relativeXDGConfigDirPath}";

  # Dotfiles
  df = {
    zsh = "${homeManagerModulesDirPath}/zsh";
    vim = "${homeManagerModulesDirPath}/vim";
    tmux = "${homeManagerModulesDirPath}/tmux";
    lf = "${homeManagerModulesDirPath}/lf";
  };
}
