{ config, pkgs, lib, ... }:

with import ./modules/variables.nix;
  let
    inherit
      username
      homeDirectory
    ;

    personalPackages = pkgs.callPackage ./modules/personalPackages.nix {};
    spacemacsFileSetup = import ./modules/emacs/spacemacs-file-setup.nix { inherit config; };
in {
  home = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    inherit username;
    inherit homeDirectory;

    # These variables solve the issue of emojis not rendering in nix's zsh
    sessionVariables = {
      LOCALE_ARCHIVE_2_11 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
      LOCALE_ARCHIVE_2_27 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
      LOCALE_ARCHIVE = "/usr/bin/locale";
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "20.09";

    packages = personalPackages;
    file = with spacemacsFileSetup; {
      # Spacemacs does not yet support xdg structure
      inherit ".spacemacs";
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (self: super: {
        nerdfonts = super.nerdfonts.override {
          fonts = [
            "Meslo"
            "Mononoki"
            "Hack"
          ];
        };
      })
    ];
  };
  xdg.enable = true;
  fonts.fontconfig.enable = true;
  targets.genericLinux.enable = true;

  # For some reason, I can't call pkgs.callPackage instead of import.
  programs = {
    home-manager.enable = true;
    feh.enable = true;
    ssh.enable = true;
    bat.enable = true;
    z-lua = { enable = true; options = ["fzf"]; enableZshIntegration = true; };
    fzf.enable = true;
    mpv.enable = true;
    lf = import ./modules/lf;
    newsboat.enable = true;
    htop.enable = true;
    neomutt.enable = true;
    tmux = import ./modules/tmux { inherit pkgs; };
    zathura.enable = true;
    zsh = import ./modules/zsh { inherit config lib; };
    neovim = import ./modules/vim { inherit pkgs; };
    git = import ./modules/git;
    emacs = import ./modules/emacs;
  };
}
