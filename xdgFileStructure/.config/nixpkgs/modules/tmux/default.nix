{ pkgs }:

with import ../variables.nix;
  let
    inherit
      df
    ;
in {
  enable = true;
  tmuxp.enable = true;
  terminal = "screen-256color";
  baseIndex = 1;
  sensibleOnTop = true;
  shortcut = "a";
  escapeTime = 1;
  keyMode = "vi";
  extraConfig = builtins.readFile "${df.tmux}/tmux.conf";
  plugins = with pkgs.tmuxPlugins; [
    resurrect
    continuum
    yank
    gruvbox
  ];
}
