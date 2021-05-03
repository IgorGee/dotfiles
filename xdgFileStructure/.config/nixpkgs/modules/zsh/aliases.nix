with import ../variables.nix;
let
  inherit
    absoluteXDGCacheDirPath
    absoluteXDGConfigDirPath
    absoluteXDGDataDirPath
    df
    dotfilesDirPath
    pAliasesFilePath
    homeDirectory
    homeManagerModulesDirPath
    reposDirPath
    xdgConfigDirPath
  ;
in {
  # pAliases
  inherit (import pAliasesFilePath)
    sshN
    mMain
    umMain
    cdMain
    mHolding
    umHolding
    cdHolding
    mRaw
    umRaw
    cdRaw
    gadn
  ;

  # Misc
  szsh = "source ${absoluteXDGConfigDirPath}/zsh/.zshrc; source ${homeDirectory}/.zshenv";
  cat = "bat";
  fm = "ranger";

  # X
  startx = "startx ${absoluteXDGConfigDirPath}/X11/xinitrc";

  # Home Manager
  hm = "home-manager";
  hms = "hm switch; szsh";

  # Editing configs
  ehp = "vim ${homeManagerModulesDirPath}/personalPackages.nix";
  eh = "vim ${nixpkgsDirPath}/home.nix";
  ea = "vim ${df.zsh}/aliases.nix";
  eap = "vim ${pAliasesFilePath}";
  ev = "vim ${df.vim}/vanilla.vim";
  evb = "vim ${df.vim}/bindings.vim";
  et = "vim ${df.tmux}/default.nix";
  ez = "vim ${df.zsh}/post-compinit.zsh";
  efm = "vim ${xdgConfigDirPath}/ranger/rc.conf";
  ex = "vim ${xdgConfigDirPath}/X11/xinitrc";
  ekb = "vim ${xdgConfigDirPath}/sxhkd/sxhkdrc";
  etwm = "vim ${xdgConfigDirPath}/bspwm/bspwmrc";
  esbar = "vim ${xdgConfigDirPath}/polybar/config";

  # Doom
  doom = "${absoluteXDGConfigDirPath}/emacs/bin/doom";

  # Common Directories
  repos = "cd ${reposDirPath}";
  reposb = "cd ${reposDirPath}/browse";
  reposc = "cd ${reposDirPath}/contribute";
  reposp = "cd ${reposDirPath}/personal";
  dotfiles = "cd ${dotfilesDirPath}";
  programs = "cd ${homeDirectory}/programs";
  xdgConfig = "cd ${xdgConfigDirPath}";
  config = "cd ${absoluteXDGConfigDirPath}";
  cache = "cd ${absoluteXDGCacheDirPath}";
  data = "cd ${absoluteXDGDataDirPath}";

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
  d = "docker";
  drun = "d exec -t";
  docker-compose = "sudo docker-compose";
  dose = "docker-compose";
  doseu = "docker-compose up -d";
  dosed = "docker-compose down";

  # Z-Lua
  zf = "z -I"; # Z using FZF
  zb = "z -b"; # Z backward (): dir with .git, (a): dir a, (a, b): replacing a with b

  # XDG Fixes
  irssi = "irssi --config=${absoluteXDGConfigDirPath}/irssi/config --home=${absoluteXDGDataDirPath}/irssi";

  shellcheck = "shellcheck -e SC1090,SC2148";

  fzfvim = "vim $(fzf)";
  fzfemacs = "emacs $(fzf)";
}
