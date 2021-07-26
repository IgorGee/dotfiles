{stdenv, pkgs, lib}:

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

    meta = with lib; {
      description = "Bash utility to extract common file archivers";
      longDescription = ''
        Bash executable to extract .zip, .rar, .bz2, .gz, .tar, .tbz2, .tgz, .Z, .7z,
        .xz, .exe, .tar.bz2, .tar.gz, .tar.xz"
      '';
      homepage = https://github.com/xvoland/Extract;
      license = licenses.mit;
    };
  };

  clustergit = stdenv.mkDerivation {
    name = "clustergit";

    src = builtins.fetchGit {
      url = "https://github.com/mnagel/clustergit";
      rev = "78c4562e3e47253dccc91d49f1f1bd24d18a4fc2";
    };

    installPhase = ''
      mkdir -p $out/bin
      cp clustergit $out/bin
    '';

    meta = with lib; {
      description = "Recursively run git commands in all git repos within a directory.";
      longDescription = ''
        Useful for doing mass checkouts, statuses, pulls, pushes, etc.
      '';
      homepage = https://github.com/mnagel/clustergit;
    };
  };
in [
  # Editor
  vscode

  # CLI
  unzip
  chafa
  neofetch
  extract
  clustergit
  lazydocker
  dragon-drop
  ueberzug
  sxiv

  # Fonts
  nerdfonts # Note this has an override below
  twitter-color-emoji
  symbola
  noto-fonts-cjk # Chinese, Japanese, Korean fonts
  noto-fonts # Residual fonts to fill in "tofu" boxes

  # Browser
  brave

  # UI
  # picom # For transparency for st. Currently breaks when opening Brave.
  xcompmgr # Older alternative for transparency for st
  bspwm # Window Manager. There is a service for this, but it doesn't seem to work or allow for
  wmname # Tool that helps fix broken applications (Datagrip showing up with gray screen only)
  # restarting of  settings. Thinking about it more, I should let home-manager do what it does
  # best, which is manage packages. For settings, it's probably better for me to manually place
  # those via stow. This lets me use proper DSL for the tool as well.
  sxhkd # Simple X Hotkey Daemon
  polybar # Status bar
  xdg_utils # Automatically open files appropriately in browser, mpv, etc.
  arandr # GUI for xrandr to help out with multi-monitor setup
  xfce.thunar # GUI File Manager
  mtpfs # Automatically connect android devices and become viewable by GUI File Managers

  # Misc
  yarn # npm alternative
  shellcheck # shell linter
  docker # docker
  docker-compose # docker-compose
  python3 # python3
  jq # required for mullvad wireguard script
  wireguard-tools # wireguard
  glibcLocales # Necessary to fix locale issues (related to rendering emoji in zsh)
  caffeine-ng
  cmake
  flameshot
  peek
  xdotool # KB/Mouse Automation
  espanso
  libnotify
  xclip
  dunst

  # Spelling/Dictionary/Thesaurus
  aspell
  aspellDicts.en
  aspellDicts.en-computers

  dbmate # Database migration handler
  postgresql_13 # So that I can use pg_dump
  jetbrains.datagrip # Database GUI
  postgresql_jdbc # Needed by database GUIs

  haskellPackages.network-manager-tui # TUI for network manager
  openvpn # oVPN connections

  xorg.xf86inputsynaptics # Needed for multi-touch and tap on trackpad for laptop
  jre8
]
