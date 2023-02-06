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
  xdragon
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
  bspwm # Window Manager. There is a service for this, but it doesn't seem to work or allow for
  wmname # Tool that helps fix broken applications (Datagrip showing up with gray screen only)
  sxhkd # Simple X Hotkey Daemon
  polybar # Status bar
  xdg_utils # Automatically open files appropriately in browser, mpv, etc.
  arandr # GUI for xrandr to help out with multi-monitor setup
  xfce.thunar # GUI File Manager
  lxappearance # Update and handle themes
  autorandr # Multiscreen handling
  dmenu # Launcher
  xclip # cli clipboard
  copyq # Clipboard manager
  glibcLocales # Necessary to fix locale issues (related to rendering emoji in zsh)
  peek # gif Recording
  espanso # global snippets
  libnotify # notifications
  dunst # notifications

  # RE Android
  apktool
  jd-gui

  # Backups and en
  rclone # Local
  borgbackup # Remote

  # Misc
  yarn # npm alternative
  shellcheck # shell linter
  gparted # partition manager
  python3 # python3
  cmake # make
  yt-dlp # yt-dl
  ffmpeg # video and audio tool
  usbutils # lsusb
  zip # zip

  # Docker and K8s
  docker # docker
  docker-compose # docker-compose
  minikube # local k8s cluster
  kubectl # For minikube
  skaffold
  helmfile

  # Spelling/Dictionary/Thesaurus
  aspell
  aspellDicts.en
  aspellDicts.en-computers

  # Database
  dbmate # Database migration handler
  postgresql_14 # So that I can use pg_dump
  jetbrains.datagrip # Database GUI
  jre8 # Requirement for datagrip
  postgresql_jdbc # Needed by database GUIs

  ansible # Ansible
  sshpass # Give password to ssh when using ansible

  # Laptop tools
  brightnessctl # adjust screen brightness
  xorg.xf86inputsynaptics # Needed for multi-touch and tap on trackpad for laptop

  # Audio
  pipewire
  pavucontrol
  audacity

  # Productivity
  obsidian
  libsForQt5.xp-pen-deco-01-v2-driver # Necessary ui application to run for drawing tablet (deco 3)
]
