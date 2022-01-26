let
  editor = "vim";

  inherit (import ../variablesCommon.nix)
    absoluteXDGCacheDirPath
    absoluteXDGConfigDirPath
    absoluteXDGDataDirPath
    df
    dotfilesDirPath
    homeDirectory
    homeManagerModulesDirPath
    nixpkgsDirPath
    xdgConfigDirPath
  ;
in {
  # Misc
  szsh = "source ${absoluteXDGConfigDirPath}/zsh/.zshrc; source ${homeDirectory}/.zshenv";
  cat = "bat";
  fm = "ranger";
  cs = "cht.sh";

  # Home Manager
  hm = "home-manager";
  hms = "hm switch; szsh";

  # Nix
  ngc = "nix-collect-garbage -d";
  ncu = "nix-channel --update";

  # Editing common configs
  edit = "${editor}";
  epc = "${editor} ${homeManagerModulesDirPath}/packagesCommon.nix";
  epd = "${editor} ${homeManagerModulesDirPath}/packagesDesktop.nix";
  eps = "${editor} ${homeManagerModulesDirPath}/packagesServer.nix";
  eh = "${editor} ${nixpkgsDirPath}/home.nix";
  eac = "${editor} ${df.zsh}/aliasesCommon.nix";
  ead = "${editor} ${df.zsh}/aliasesDesktop.nix";
  eas = "${editor} ${df.zsh}/aliasesServer.nix";
  ev = "${editor} ${df.vim}/vanilla.vim";
  evb = "${editor} ${df.vim}/bindings.vim";
  et = "${editor} ${df.tmux}/default.nix";
  ezc = "${editor} ${df.zsh}/post-compinit-common.zsh";
  ezd = "${editor} ${df.zsh}/post-compinit-desktop.zsh";
  ezs = "${editor} ${df.zsh}/post-compinit-server.zsh";
  efm = "${editor} ${xdgConfigDirPath}/ranger/rc.conf";

  # Common Directories
  dotfiles = "cd ${dotfilesDirPath}";
  xdgConfig = "cd ${xdgConfigDirPath}";
  config = "cd ${absoluteXDGConfigDirPath}";
  cache = "cd ${absoluteXDGCacheDirPath}";
  data = "cd ${absoluteXDGDataDirPath}";

  # Tmux
  tm = "tmux";

  # Node
  ninit = "yarn init -y";
  nda = "yarn add";
  ndad = "yarn add --dev";
  # https://github.com/yarnpkg/yarn/issues/5056
  ndag = "npm_config_registry=http://npm.geenethlab/ yarn global add";
  ndr = "yarn remove";
  ndrg = "npm_config_registry=http://npm.geenethlab/ yarn global remove";
  ndu = "yarn upgrade-interactive --latest";
  nre = "yarn runExecutable";
  np = "npm publish --registry http://npm.geenethlab/";

  # Conventioned Projects with 'run' script
  pr = "sh run";

  # Kubernetes
  k = "kubectl";
  ka = "k apply -f";

  # C
  mi = "sudo make install";
  mci = "sudo make clean install";

  # Z-Lua
  zf = "z -I"; # Z using FZF
  zb = "z -b"; # Z backward (): dir with .git, (a): dir a, (a, b): replacing a with b

  shellcheck = "shellcheck -e SC1090,SC2148";

  fzfvim = "vim $(fzf)";
}
