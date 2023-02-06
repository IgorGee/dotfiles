{ config, pkgs, lib, ... }:
{
  home = {
    # These variables solve the issue of emojis not rendering in nix's zsh
    sessionVariables = {
      LOCALE_ARCHIVE_2_11 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
      LOCALE_ARCHIVE_2_27 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
      LOCALE_ARCHIVE = "/usr/bin/locale";
    };

    # Seems like the imports = [...] syntax in home.nix automerges program configs, INCLUDING handling recursion and array concats.
    # No need to merge in common
    packages = pkgs.callPackage ./modules/packagesDesktop.nix {};
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
    mpv = {
      enable = true;
      config = {
        speed = 2;
        autofit-larger = "960x540";
        geometry = "100%:100%";
      };
    };
    newsboat.enable = true;
    neomutt.enable = true;
    zathura.enable = true;
    emacs.enable = true;
    # Seems like the imports = [...] syntax in home.nix automerges program configs, INCLUDING handling recursion and array concats
    zsh = import ./modules/zsh/desktop.nix { inherit config lib; };
  };
}
