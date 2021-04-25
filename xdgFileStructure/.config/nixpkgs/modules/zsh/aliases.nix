with import ../variables.nix;
let
  inherit
    absoluteXDGCachePath
    absoluteXDGConfigPath
    absoluteXDGDataPath
    df
    dotfilesPath
    pAliasesPath
    homeDirectory
    homeManagerModulesPath
    relativeXDGConfigPath
    reposDir
    xdgConfig
  ;
in {
  # pAliases
  inherit (import pAliasesPath)
    mMain
    umMain
    mHolding
    umHolding
    mRaw
    umRaw
  ;

  # Misc
  szsh = "source ${absoluteXDGConfigPath}/zsh/.zshrc; source ${homeDirectory}/.zshenv";
  cat = "bat";
  fm = "ranger";

  # X
  startx = "startx ${absoluteXDGConfigPath}/X11/xinitrc";

  # Home Manager
  hm = "home-manager";
  hms = "hm switch; szsh";

  # Editing configs
  ehp = "vim ${homeManagerModulesPath}/personalPackages.nix";
  eh = "vim ${nixpkgsPath}/home.nix";
  ea = "vim ${df.zsh}/aliases.nix";
  ev = "vim ${df.vim}/vanilla.vim";
  evb = "vim ${df.vim}/bindings.vim";
  et = "vim ${df.tmux}/default.nix";
  ez = "vim ${df.zsh}/post-compinit.zsh";
  efm = "vim ${xdgConfig}/ranger/rc.conf";
  ex = "vim ${xdgConfig}/X11/xinitrc";
  ekb = "vim ${xdgConfig}/sxhkd/sxhkdrc";
  etwm = "vim ${xdgConfig}/bspwm/bspwmrc";
  esbar = "vim ${xdgConfig}/polybar/config";

  # Doom
  doom = "${absoluteXDGConfigPath}/emacs/bin/doom";

  # Common Directories
  repos = "cd ${reposDir}";
  reposb = "cd ${reposDir}/browse";
  reposc = "cd ${reposDir}/contribute";
  reposp = "cd ${reposDir}/personal";
  dotfiles = "cd ${dotfilesPath}";
  programs = "cd ${homeDirectory}/programs";
  xdgConfig = "cd ${xdgConfig}";
  config = "cd ${absoluteXDGConfigPath}";
  cache = "cd ${absoluteXDGCachePath}";
  data = "cd ${absoluteXDGDataPath}";

  # Git
  gfp = "git format-patch master -o patches"; # Create patch against master in patches directory
  magit = "vim +MagitOnly";
  rgit = "THREAD_POOL_WORKERS=6 clustergit --recursive";
  #Submodules
  gsa = "git submodule add";
  gsur = "git submodule update --init --remote --recursive";

  # Tmux
  tm = "tmux";

  # Yarn
  y = "yarn";
  yi = "yarn init -y";
  ya = "y add";
  yd = "y add --dev";
  yg = "y global add";
  ys = "y start";
  yul = "y upgrade-interactive --latest";
  yt = "y test";
  yl = "y lint";
  yr = "y remove";
  yys = "y && ys";

  # C
  mi = "sudo make install";
  mci = "sudo make clean install";

  # Docker
  docker = "sudo docker";
  docker-compose = "sudo docker-compose";
  d = "docker";
  dose = "docker-compose";

  # Z-Lua
  zf = "z -I"; # Z using FZF
  zb = "z -b"; # Z backward (): dir with .git, (a): dir a, (a, b): replacing a with b

  # XDG Fixes
  irssi = "irssi --config=${absoluteXDGConfigPath}/irssi/config --home=${absoluteXDGDataPath}/irssi";

  shellcheck = "shellcheck -e SC1090,SC2148";

  fzfvim = "vim $(fzf)";
  fzfemacs = "emacs $(fzf)";
}
