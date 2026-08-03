{ pkgs, username, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Homebrew から移行した cask 等（Gemini 等）用
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 6;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  # Touch ID で sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # nix 本体と darwin-rebuild
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
  ];

  # システム全体のフォント（Homebrew cask font-plemol-jp / font-plemol-jp-nf 相当）
  fonts.packages = with pkgs; [
    plemoljp
    plemoljp-nf
  ];

  # 会社端末などホスト名が変わっても同じ flake 出力名 (macos) で適用できる
  system.primaryUser = username;

  # Homebrew は使わない方針。既存の ~/.homebrew が PATH に残らないよう nix-darwin 側では触らない
  # 移行完了後に手動で削除: rm -rf ~/.homebrew
}
