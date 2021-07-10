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
  cs = "cht.sh";

  # X
  startx = "startx ${absoluteXDGConfigDirPath}/X11/xinitrc";

  # Home Manager
  hm = "home-manager";
  hms = "hm switch; szsh";

  # Nix
  ngc = "nix-collect-garbage -d";

  # Editing configs
  edit = "${editor}";
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
  en = "${editor} ${xdgConfigDirPath}/dunst/dunstrc";
  es = "${editor} ${xdgConfigDirPath}/espanso/default.yml";

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

  # Node
  ni = "yarn";
  nr = "yarn run";
  ninit = "yarn init -y";
  nda = "yarn add";
  ndad = "yarn add --dev";
  # https://github.com/yarnpkg/yarn/issues/5056
  ndag = "npm_config_registry=http://localhost:4873 yarn global add";
  ndr = "yarn remove";
  ndrg = "yarn global remove";
  ndu = "yarn upgrade-interactive --latest";
  nrs = "yarn start";
  nrd = "yarn dev";
  nrt = "yarn test";
  nrl = "yarn lint";
  nre = "yarn runExecutable";
  np = "yarn publish";
  nb = "yarn build";
  nw = "yarn watch";
  nv = "yarn version --no-git-tag-version";
  nvM = "nv --major";
  nvm = "nv --minor";
  nvp = "nv --patch";
  nreset = "rm -rf node_modules yarn.lock && ni";

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
