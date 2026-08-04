{ config, pkgs, username, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.05";

  imports = [
    ./packages.nix
    ./apps.nix
    ./dotfiles.nix
    ./programs.nix
    ./services.nix
  ];
}
