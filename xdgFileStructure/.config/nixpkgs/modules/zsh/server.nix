{ config, lib }:

with import ../variablesCommon.nix;
  let
    inherit
      df
    ;
in {
  initExtra = builtins.readFile "${df.zsh}/post-compinit-server.zsh";
  oh-my-zsh = {
    plugins = [
      "kubectl"
    ];
  };
}
