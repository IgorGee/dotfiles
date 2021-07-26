with import ./variablesCommon.nix;
let
  inherit
    homeDirectory
  ;
in rec {
  inherit (import ./variablesCommon.nix)
    username
    homeDirectory
    relativeXDGConfigDirPath
    relativeXDGDataDirPath
    relativeXDGCacheDirPath
    absoluteXDGConfigDirPath
    absoluteXDGDataDirPath
    absoluteXDGCacheDirPath
    nixBinDir
    dotfilesDirPath
    nixpkgsDirPath
    homeManagerModulesDirPath
    xdgFileStructureDirPath
    xdgConfigDirPath
    df
  ;

  reposDirPath = "${homeDirectory}/repos";
  pDotfilesDirPath= "${homeDirectory}/repos/personal/pdotfiles";
  pAliasesFilePath= "${pDotfilesDirPath}/pAliases.nix";
}
