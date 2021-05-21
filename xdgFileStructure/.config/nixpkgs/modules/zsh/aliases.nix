with import ../variables.nix;
let
  editor = "emacsclient -n";

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
  ehp = "${editor} ${homeManagerModulesDirPath}/personalPackages.nix";
  eh = "${editor} ${nixpkgsDirPath}/home.nix";
  ea = "${editor} ${df.zsh}/aliases.nix";
  eap = "${editor} ${pAliasesFilePath}";
  ev = "${editor} ${df.vim}/vanilla.vim";
  evb = "${editor} ${df.vim}/bindings.vim";
  et = "${editor} ${df.tmux}/default.nix";
  ez = "${editor} ${df.zsh}/post-compinit.zsh";
  efm = "${editor} ${xdgConfigDirPath}/ranger/rc.conf";
  ex = "${editor} ${xdgConfigDirPath}/X11/xinitrc";
  ekb = "${editor} ${xdgConfigDirPath}/sxhkd/sxhkdrc";
  etwm = "${editor} ${xdgConfigDirPath}/bspwm/bspwmrc";
  esbar = "${editor} ${xdgConfigDirPath}/polybar/config";

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
