with import "/home/igor/dotfiles/variables.nix";
let
  inherit
    absoluteXDGConfigPath
    absoluteXDGCachePath
    absoluteXDGDataPath
    relativeXDGConfigPath
    homeDirectory
    dotfilesPath
    df
  ;
  xdgFileStructure = "xdgFileStructure";
  xdgConfig = "${dotfilesPath}/${xdgFileStructure}/${relativeXDGConfigPath}";
in {
  # Misc
  szsh = "source ${absoluteXDGConfigPath}/zsh/.zshrc; source ${homeDirectory}/.zshenv";
  cat = "bat";

  # X
  startx = "startx ${absoluteXDGConfigPath}/X11/xinitrc";

  # Home Manager
  hm = "home-manager";
  hms = "hm switch; szsh";

  # Editing configs
  eh = "hm edit";
  ea = "vim ${df.zsh}/aliases.nix";
  ev = "vim ${df.vim}/vanilla.vim";
  evb = "vim ${df.vim}/bindings.vim";
  et = "vim ${df.tmux}/tmux.conf";
  ez = "vim ${df.zsh}/post-compinit.zsh";
  ex = "vim ${xdgConfig}/X11/xinitrc";
  ekb = "vim ${xdgConfig}/sxhkd/sxhkdrc";
  etwm = "vim ${xdgConfig}/bspwm/bspwmrc";
  esbar = "vim ${xdgConfig}/polybar/config";

  # Common Directories
  repos = "cd ${homeDirectory}/repos";
  reposb = "cd ${homeDirectory}/repos/browse";
  reposc = "cd ${homeDirectory}/repos/contribute";
  reposp = "cd ${homeDirectory}/repos/personal";
  dotfiles = "cd ${dotfilesPath}";
  programs = "cd ${homeDirectory}/programs";
  xdgConfig = "cd ${xdgConfig}";
  config = "cd ${absoluteXDGConfigPath}";
  cache = "cd ${absoluteXDGCachePath}";
  data = "cd ${absoluteXDGDataPath}";

  # Git
  gfp = "git format-patch master -o patches"; # Create patch against master in patches directory

  # Tmux
  tm = "tmux -2";

  # C
  mi = "sudo make install";
  mci = "sudo make clean install";

  # XDG Fixes
  irssi = "irssi --config=${absoluteXDGConfigPath}/irssi/config --home=${absoluteXDGDataPath}/irssi";

  shellcheck = "shellcheck -e SC1090,SC2148";


  # Docker
  docker = "sudo docker";
  docker-compose = "sudo docker-compose";
  d = "docker";
  dose = "docker-compose";
}
