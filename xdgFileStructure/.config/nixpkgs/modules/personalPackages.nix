{pkgs}:

with pkgs;
[
  glibcLocales
  # Editor
  ctags
  vscode

  # CLI
  ripgrep
  ripgrep-all
  stow
  tree
  unzip
  pistol
  gtop
  ctop
  chafa
  neofetch

  # Fonts
  nerdfonts # Note this has an override below
  twitter-color-emoji
  symbola

  # Browser
  brave

  # UI
  dmenu # Adhoc command runner
  # picom # For transparency for st. Currently breaks when opening Brave.
  xcompmgr # Older alternative for transparency for st
  bspwm # Window Manager. There is a service for this, but it doesn't seem to work or allow for
  # restarting of  settings. Thinking about it more, I should let home-manager do what it does
  # best, which is manage packages. For settings, it's probably better for me to manually place
  # those via stow. This lets me use proper DSL for the tool as well.
  sxhkd # Simple X Hotkey Daemon
  polybar # Status bar
  xdg_utils # Automatically open files appropriately in browser, mpv, etc.

  # Misc
  nodejs-14_x
  shellcheck
  docker
  docker-compose
  python3
  jq
  wireguard-tools
]