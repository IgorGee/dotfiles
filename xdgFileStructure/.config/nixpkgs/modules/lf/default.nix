with import ../variables.nix;
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