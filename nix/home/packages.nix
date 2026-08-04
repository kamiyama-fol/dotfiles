{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # 旧 Homebrew formula
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
    git

    # 旧 pyenv / rbenv / nvm / volta の代替
    ruby

    # Rust
    rustc
    cargo
    rustfmt
    clippy

    # ユーティリティ
    curl
    wget
    gnumake
    tree
  ];
}
