{ config, pkgs, lib, ... }:

with import ./modules/variablesCommon.nix;
  let
    inherit
      username
      homeDirectory
    ;
in {
  home = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    inherit username;
    inherit homeDirectory;

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "20.09";
  };

  xdg.enable = true;
  targets.genericLinux.enable = true;

  # For some reason, I can't call pkgs.callPackage instead of import.
  programs = {
    home-manager.enable = true;
    ssh.enable = true;
    bat.enable = true;
    z-lua = { enable = true; options = ["fzf"]; enableZshIntegration = true; };
    fzf.enable = true;
    lf = import ./modules/lf;
    htop.enable = true;
    tmux = import ./modules/tmux { inherit pkgs; };
    zsh = import ./modules/zsh/common.nix { inherit config lib; };
    neovim = import ./modules/vim { inherit pkgs; };
    git = import ./modules/git;
  };
}
