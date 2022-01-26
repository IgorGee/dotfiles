let
  editor = "emacsclient -n";

  inherit (import ../variablesDesktop.nix)
    absoluteXDGCacheDirPath
    absoluteXDGConfigDirPath
    absoluteXDGDataDirPath
    pAliasesFilePath
    homeDirectory
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

  # X
  startx = "startx ${absoluteXDGConfigDirPath}/X11/xinitrc";

  # Editing desktop configs
  edit = "${editor}";
  eap = "${editor} ${pAliasesFilePath}";
  ex = "${editor} ${xdgConfigDirPath}/X11/xinitrc";
  ekb = "${editor} ${xdgConfigDirPath}/sxhkd/sxhkdrc";
  etwm = "${editor} ${xdgConfigDirPath}/bspwm/bspwmrc";
  esbar = "${editor} ${xdgConfigDirPath}/polybar/config";
  en = "${editor} ${xdgConfigDirPath}/dunst/dunstrc";
  es = "${editor} ${xdgConfigDirPath}/espanso/default.yml";

  # Doom
  doom = "${absoluteXDGConfigDirPath}/emacs/bin/doom";

  # Common Directories
  repos = "cd ${reposDirPath}";
  reposb = "cd ${reposDirPath}/browse";
  reposc = "cd ${reposDirPath}/contribute";
  reposp = "cd ${reposDirPath}/personal";
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

  # Docker
  d = "docker";
  drun = "d exec -t";
  docker-compose = "sudo docker-compose";
  dose = "docker-compose";
  doseu = "docker-compose up -d";
  dosed = "docker-compose down";

  # Kubernetes
  lk = "minikube"; # Local Kubernetes

  # XDG Fixes
  irssi = "irssi --config=${absoluteXDGConfigDirPath}/irssi/config --home=${absoluteXDGDataDirPath}/irssi";

  fzfemacs = "emacs $(fzf)";
}
