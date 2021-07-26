with import ../variablesCommon.nix;
  let
    inherit
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