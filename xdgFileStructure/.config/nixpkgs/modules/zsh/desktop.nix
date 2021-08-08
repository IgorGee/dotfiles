{ config, lib }:

let
  inherit (import ../variablesCommon.nix)
    relativeXDGConfigDirPath
    df
  ;
in {
  # To get aliases to work in vim shell execution, we need to put them in zshenv
  envExtra =
    "EDITOR=vim\n" +
    builtins.concatStringsSep "\n"
      (lib.mapAttrsToList (k: v: "alias ${k}=${lib.escapeShellArg v}")
        (import "${df.zsh}/aliasesDesktop.nix")); # No idea how, but aliasesCommon is somehow automatically merged into this.
  initExtra = builtins.readFile "${df.zsh}/post-compinit-desktop.zsh";
  oh-my-zsh = {
    plugins = [
      "docker"
      "docker-compose"
      "extract"
    ];
  };
  sessionVariables = {
    BROWSER = "brave";
    # Xorg
    # Only respected by xinit, not startx
    XINITRC="${config.xdg.configHome}/X11/xinitrc";
    XAUTHORITY="${config.xdg.cacheHome}/Xauthority";
    ICEAUTHORITY="${config.xdg.cacheHome}/ICEauthority";
    # VSCode
    VSCODE_PORTABLE="${config.xdg.dataHome}/vscode";

    # NPM
    NPM_CONFIG_USERCONFIG="${config.xdg.configHome}/npm/npmrc";
  };
}
