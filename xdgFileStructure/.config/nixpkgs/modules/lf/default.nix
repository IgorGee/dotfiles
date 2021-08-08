let
  inherit (import ../variablesCommon.nix)
    nixBinDir
  ;
in {
  enable = true;
  settings = {
    hidden = true;
    icons = true;
  };
  previewer.source = "${nixBinDir}/pistol";
}