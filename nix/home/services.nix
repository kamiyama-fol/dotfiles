{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in
{
  # Hammerspoon をログイン時に起動（ウィンドウ管理ホットキー）
  services.hammerspoon = {
    enable = true;
    configPath = "${dotfiles}/.hammerspoon";
  };
}
