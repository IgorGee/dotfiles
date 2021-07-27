{ config, pkgs, lib, ... }:

{
  home = {
    packages = pkgs.callPackage ./modules/packagesServer.nix {};
  };

  programs = {
    zsh = import ./modules/zsh/server.nix { inherit config lib; };
  };
}
