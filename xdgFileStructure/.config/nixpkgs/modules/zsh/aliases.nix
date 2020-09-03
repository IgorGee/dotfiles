with import ../variables.nix;
let
  inherit
    absoluteXDGCachePath
    absoluteXDGConfigPath
    absoluteXDGDataPath
    df
    dotfilesPath
    homeDirectory
    homeManagerModulesPath
    relativeXDGConfigPath
  ;

  xdgFileStructure = "xdgFileStructure";
  dotfilesConfig = "${dotfilesPath}/${xdgFileStructure}/${relativeXDGConfigPath}";

  reposDir = "${homeDirectory}/repos";
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
  eh = "vim ${homeManagerModulesPath}/personalPackages.nix";
  ea = "vim ${df.zsh}/aliases.nix";
  ev = "vim ${df.vim}/vanilla.vim";
  evb = "vim ${df.vim}/bindings.vim";
  et = "vim ${df.tmux}/default.nix";
  ez = "vim ${df.zsh}/post-compinit.zsh";
  ex = "vim ${dotfilesConfig}/X11/xinitrc";
  ekb = "vim ${dotfilesConfig}/sxhkd/sxhkdrc";
  etwm = "vim ${dotfilesConfig}/bspwm/bspwmrc";
  esbar = "vim ${dotfilesConfig}/polybar/config";

  # Common Directories
  repos = "cd ${reposDir}";
  reposb = "cd ${reposDir}/browse";
  reposc = "cd ${reposDir}/contribute";
  reposp = "cd ${reposDir}/personal";
  dotfiles = "cd ${dotfilesPath}";
  programs = "cd ${homeDirectory}/programs";
  xdgConfig = "cd ${dotfilesConfig}";
  config = "cd ${absoluteXDGConfigPath}";
  cache = "cd ${absoluteXDGCachePath}";
  data = "cd ${absoluteXDGDataPath}";

  # Git
  gfp = "git format-patch master -o patches"; # Create patch against master in patches directory
  magit = "vim +MagitOnly";

  # Tmux
  tm = "tmux";

  # C
  mi = "sudo make install";
  mci = "sudo make clean install";

  # Docker
  docker = "sudo docker";
  docker-compose = "sudo docker-compose";
  d = "docker";
  dose = "docker-compose";

  # NPM
  npm = "${absoluteXDGDataPath}/npm/bin/npm";

  # XDG Fixes
  irssi = "irssi --config=${absoluteXDGConfigPath}/irssi/config --home=${absoluteXDGDataPath}/irssi";

  shellcheck = "shellcheck -e SC1090,SC2148";
}
