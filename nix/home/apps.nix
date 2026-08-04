{ pkgs, ... }:

{
  # GUI アプリを ~/Applications に配置（WezTerm 等の既存パスと合わせる）
  targets.darwin.linkApps = {
    enable = true;
    directory = "Applications";
  };

  home.packages = with pkgs; [
    # ターミナル・自動化
    wezterm

    # ブラウザ・生産性
    # obsidian — nixpkgs ビルドが不安定なため手動インストール（MIGRATION.md 参照）
    google-chrome
    slack
    postman
  ];
}
