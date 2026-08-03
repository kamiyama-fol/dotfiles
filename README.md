# dotfiles

Kamiyama の macOS 開発環境。**nix-darwin + home-manager** でパッケージと dotfiles を宣言的に管理します。

## 新しい Mac（会社端末交換）でのセットアップ

ホスト名に依存しない flake 出力名 `macos` を使うので、端末が変わっても同じコマンドで復元できます。

### 1. Nix をインストール

[Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)（macOS 向けに推奨）:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

ターミナルを開き直し、`nix --version` が通ることを確認します。

### 2. dotfiles を clone

```bash
git clone <このリポジトリの URL> ~/dotfiles
cd ~/dotfiles
```

### 3. 設定を反映（初回）

```bash
nix run nix-darwin -- switch --flake ~/dotfiles#macos
```

以降は PATH に `darwin-rebuild` が入るので:

```bash
darwin-rebuild switch --flake ~/dotfiles#macos
```

### 4. 動作確認

```bash
which gh nvim go node python3 psql
gh --version
nvim --version
```

## 日常運用

| 操作 | コマンド |
|------|----------|
| 設定変更を反映 | `darwin-rebuild switch --flake ~/dotfiles#macos` |
| 変更内容の dry-run | `darwin-rebuild switch --flake ~/dotfiles#macos --dry-run` |
| 1 世代前に戻す | `darwin-rebuild --rollback` |
| flake 入力を更新 | `nix flake update` |
| home-manager のみ試す | `home-manager switch --flake ~/dotfiles#k.ueyama` |

## ディレクトリ構成

```
dotfiles/
├── flake.nix              # flake エントリポイント
├── nix/
│   ├── darwin/default.nix # macOS システム（フォント、nix 設定、Touch ID sudo 等）
│   └── home/home.nix      # ユーザーパッケージ + dotfiles symlink
├── .config/               # wezterm, nvim, karabiner 等（従来どおり git 管理）
├── .bash_profile
└── Makefile               # 旧 install（移行期間中のみ）
```

## Homebrew から Nix への移行

現在の brew パッケージは `nix/home/home.nix` に移植済みです。

| 旧 | 新 |
|----|-----|
| `~/.homebrew` formula | `home.packages` |
| pyenv / nvm / rbenv / volta | nixpkgs の python314 / nodejs / ruby |
| `~/.cargo` の starship | nixpkgs の starship |
| `~/.nvim` 手動インストール | nixpkgs の neovim |
| Makefile の go 手動インストール | nixpkgs の go |
| cask font-plemol-jp* | `fonts.packages` (plemoljp / plemoljp-nf) |

`.bash_profile` は **nix 移行前後で共存** できるよう分岐しています。`hm-session-vars.sh` がある場合は nix 管理の PATH のみ使い、なければ従来の Homebrew / pyenv 等にフォールバックします。

移行が完了したら以下を削除できます:

```bash
# 任意: 旧パッケージマネージャの残骸
rm -rf ~/.homebrew ~/.pyenv ~/.nvm ~/.rbenv ~/.volta ~/.nvim ~/.go
brew uninstall --cask ...  # 残っていれば
```

## nixpkgs に無い GUI アプリ

以下は nix では管理していません。必要なら手動インストールしてください。

| アプリ | 備考 |
|--------|------|
| Gemini（Google AI） | App Store / 公式サイト |
| Motrix | `nix/home/home.nix` のコメントを外すと nixpkgs 版を試せます |

## カスタマイズ

- **パッケージ追加**: `nix/home/home.nix` の `home.packages`
- **フォント / システム設定**: `nix/darwin/default.nix`
- **ユーザー名変更**: `flake.nix` の `username` と `nix/home/home.nix` を合わせて変更

## 旧 Makefile ベースの install

移行期間中は `make install` も残していますが、新規 Mac では **上記 nix 手順のみ** を使うことを推奨します。
