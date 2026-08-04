{ pkgs, ... }:

{
  # GUI アプリを /Applications にリンク
  targets.darwin.linkApps = "link";

  home.packages = with pkgs; [
    # ターミナル・自動化
    wezterm
    hammerspoon

    # ブラウザ・生産性
    google-chrome
    obsidian
    slack
    postman
  ];
}
