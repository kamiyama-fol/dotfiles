{ config, pkgs, username, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.05";

  # ---------------------------------------------------------------------------
  # CLI ツール（旧 Homebrew formula + Makefile で入れていたもの）
  # ---------------------------------------------------------------------------
  home.packages = with pkgs; [
    # 旧 brew formula
    awscli2
    bash
    bison
    fd
    gh
    go
    jq
    lazygit
    meson
    ninja
    nodejs_24
    openssl
    pkg-config
    postgresql_18
    python314
    ripgrep
    tbls
    tree-sitter

    # 旧 Makefile / 手動インストール
    neovim
    starship
    git

    # 旧 pyenv / rbenv / nvm / volta の代替
    ruby

    # Rust（cargo install 不要）
    rustc
    cargo
    rustfmt
    clippy

    # よく使うユーティリティ
    curl
    wget
    gnumake
    tree
  ];

  # GUI アプリで nixpkgs に無いもの（Gemini 等）は README の手動インストール欄を参照
  # motrix は nixpkgs にある場合のみ有効化:
  # motrix

  # ---------------------------------------------------------------------------
  # dotfiles リポジトリへの symlink（編集は git 管理のまま）
  # ---------------------------------------------------------------------------
  home.file = {
    ".bash_profile".source = symlink "${dotfiles}/.bash_profile";
    ".bashrc".source = symlink "${dotfiles}/.bashrc";
    ".hammerspoon".source = symlink "${dotfiles}/.hammerspoon";
    ".config".source = symlink "${dotfiles}/.config";
  };

  # git commit template
  home.file.".gitmessage".source = symlink "${dotfiles}/gitmessage.txt";

  programs.git = {
    enable = true;
    extraConfig = {
      commit.template = "${config.home.homeDirectory}/dotfiles/gitmessage.txt";
      init.defaultBranch = "main";
    };
  };

  # bash は dotfiles 側を使う。HM のパッケージ PATH を有効にするため sessionVariables を設定
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    LANG = "ja_JP.UTF-8";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.bin"
  ];
}
