{ config, lib }:

with import ../variables.nix;
  let
    inherit
      relativeXDGConfigPath
      df
    ;
in {
  enable = true;
  enableAutosuggestions = true;
  dotDir = "${relativeXDGConfigPath}/zsh";
  history = {
    path = "${config.xdg.dataHome}/zsh/.zsh_history";
  };
  # shellAliases = import "${df.zsh}/aliases.nix";
  # To get aliases to work in vim shell execution, we need to put them in zshenv
  envExtra =
    "EDITOR=vim\n" +
    builtins.concatStringsSep "\n"
      (lib.mapAttrsToList (k: v: "alias ${k}=${lib.escapeShellArg v}")
        (import "${df.zsh}/aliases.nix"));
  initExtra = builtins.readFile "${df.zsh}/post-compinit.zsh";
  oh-my-zsh = {
    enable = true;
    custom = "${df.zsh}/ohMyZshCustomizations";
    theme = "powerlevel10k/powerlevel10k";
    plugins = [
      "git"
      "sudo"
      "tmux"
      "docker"
      "docker-compose"
      "fzf"
      "ripgrep"
      "extract"
      "zsh-syntax-highlighting"
    ];
  };
  sessionVariables = {
    EDITOR = "vim";
    BROWSER = "brave";

    # Misc XDG Spec Fixes

    # LESS
    LESSHISTFILE="-";

    # Xorg
    # Only respected by xinit, not startx
    XINITRC="${config.xdg.configHome}/X11/xinitrc";
    XAUTHORITY="${config.xdg.cacheHome}/Xauthority";
    ICEAUTHORITY="${config.xdg.cacheHome}/ICEauthority";

    # Z-Lua
    _ZL_DATA = "${config.xdg.dataHome}/zlua/.zlua";

    # GnuPG
    GNUPGNOME="${config.xdg.dataHome}/gnupg";

    # Bash
    HISTFILE="${config.xdg.dataHome}/bash/history";

    # VSCode
    VSCODE_PORTABLE="${config.xdg.dataHome}/vscode";

    # NPM
    NPM_CONFIG_USERCONFIG="${config.xdg.configHome}/npm/npmrc";

    # Something is messing with my locale :(
    LANG="en_US.UTF-8";
  };
}
