{ config, lib }:

let
  inherit (import ../variablesCommon.nix)
    df
  ;
in {
  initExtra = builtins.readFile "${df.zsh}/post-compinit-server.zsh";
  # To get aliases to work in vim shell execution, we need to put them in zshenv
  envExtra =
    builtins.concatStringsSep "\n"
      (lib.mapAttrsToList (k: v: "alias ${k}=${lib.escapeShellArg v}")
        (import "${df.zsh}/aliasesServer.nix"));
  oh-my-zsh = {
    plugins = [
      "kubectl"
    ];
  };
  sessionVariables = {
    # k3s
    KUBECONFIG="/etc/rancher/k3s/k3s.yaml";
  };
}
