{ config, lib }:

let
  inherit (import ../variablesCommon.nix)
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
