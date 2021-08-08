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
  ead = "${editor} ${df.zsh}/aliasesCommon.nix";
  ev = "${editor} ${df.vim}/vanilla.vim";
  evb = "${editor} ${df.vim}/bindings.vim";
  et = "${editor} ${df.tmux}/default.nix";
  ezc = "${editor} ${df.zsh}/post-compinit-common.zsh";
  ezd = "${editor} ${df.zsh}/post-compinit-desktop.zsh";
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
