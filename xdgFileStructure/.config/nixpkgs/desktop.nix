{ config, pkgs, lib, ... }:
let 
  packagesDesktop = pkgs.callPackage ./modules/packagesDesktop.nix {};
  packagesCommon = pkgs.callPackage ./modules/packagesCommon.nix {};
in {
  imports = [ ./common.nix ];
  home = {
    # These variables solve the issue of emojis not rendering in nix's zsh
    sessionVariables = {
      LOCALE_ARCHIVE_2_11 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
      LOCALE_ARCHIVE_2_27 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
      LOCALE_ARCHIVE = "/usr/bin/locale";
    };

    packages = packagesCommon ++ packagesDesktop;
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

  fonts.fontconfig.enable = true;

  # For some reason, I can't call pkgs.callPackage instead of import.
  programs = {
    feh.enable = true;
    mpv.enable = true;
    newsboat.enable = true;
    neomutt.enable = true;
    zathura.enable = true;
    emacs.enable = true;
    # Seems like the imports = [...] syntax in home.nix automerges program configs, INCLUDING handling recursion and array concats
    zsh = import ./modules/zsh/desktop.nix { inherit config lib; };
    rofi = {
      enable = true;
      theme = "Arc-Dark";
    };
  };
}
