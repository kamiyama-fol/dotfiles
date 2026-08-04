{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  # .hammerspoon は services.nix の Hammerspoon サービスが管理
  home.file = {
    ".bash_profile".source = symlink "${dotfiles}/.bash_profile";
    ".bashrc".source = symlink "${dotfiles}/.bashrc";
    ".config".source = symlink "${dotfiles}/.config";
  };
}
