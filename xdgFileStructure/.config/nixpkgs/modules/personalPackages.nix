{stdenv, pkgs}:

with pkgs;
let
  extract = stdenv.mkDerivation {
    name = "extract";

    src = builtins.fetchGit {
      url = "https://github.com/xvoland/Extract";
      rev = "dad7ff492c70f848514a516e238a9cd87e37e0d9";
    };

    installPhase = ''
      mkdir -p $out/bin
      echo -e "\nextract \"\$@\"" >> extract.sh
      cp extract.sh $out/bin/extract
      chmod +x $out/bin/extract
    '';
  };
in [
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
  extract

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
  nodejs-14_x # nodejs
  shellcheck # shell linter
  docker # docker
  docker-compose # docker-compose
  python3 # python3
  jq # required for mullvad wireguard script
  wireguard-tools # wireguard
  glibcLocales # Necessary to fix locale issues (related to rendering emoji in zsh)
]