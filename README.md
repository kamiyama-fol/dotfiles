# dotfiles

Kamiyama の macOS 開発環境。**nix-darwin + home-manager** でパッケージ・macOS 設定・dotfiles を宣言的に管理します。

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

### 4. 秘密情報・手動移行

[nix/MIGRATION.md](nix/MIGRATION.md) のチェックリストに従い、SSH 鍵・`gh auth` 等を移行してください。

### 5. 動作確認

```bash
which wezterm gh nvim go node python3 psql
open -a WezTerm
open -a "Karabiner-Elements"
open -a Hammerspoon
gh auth status
```

## 引き継がれる設定の一覧

| カテゴリ | 内容 | 管理場所 |
|----------|------|----------|
| macOS 設定 | ダークモード、キーリピート、Dock、Finder、トラックパッド | `nix/darwin/defaults.nix` |
| フォント | PlemolJP / PlemolJP NF | `nix/darwin/default.nix` |
| セキュリティ | Touch ID sudo | `nix/darwin/default.nix` |
| シェル | bash（デフォルトシェル）、`.bashrc` / `.bash_profile` | nix-darwin + dotfiles |
| CLI ツール | gh, nvim, go, node, python, postgresql 等 | `nix/home/packages.nix` |
| GUI アプリ | WezTerm, Chrome, Obsidian, Slack, Postman, Hammerspoon | `nix/home/apps.nix` |
| 自動起動 | Karabiner-Elements, Hammerspoon | `nix/darwin/services.nix`, `nix/home/services.nix` |
| エディタ・ターミナル | nvim, wezterm, karabiner 設定 | `.config/` symlink |
| ウィンドウ管理 | Hammerspoon ホットキー | `.hammerspoon/` |
| Git / プロンプト | user.name/email, starship | `nix/home/programs.nix` |

**手動移行が必要:** SSH 鍵、GitHub トークン、Cursor、Docker Desktop、会社 VPN/EDR 等 → [nix/MIGRATION.md](nix/MIGRATION.md)

## 日常運用

| 操作 | コマンド |
|------|----------|
| 設定変更を反映 | `darwin-rebuild switch --flake ~/dotfiles#macos` |
| 変更内容の dry-run | `darwin-rebuild switch --flake ~/dotfiles#macos --dry-run` |
| 1 世代前に戻す | `darwin-rebuild --rollback` |
| flake 入力を更新 | `nix flake update` |
| flake 構文チェック | `make nix-check` |

## ディレクトリ構成

```
dotfiles/
├── flake.nix
├── nix/
│   ├── darwin/
│   │   ├── default.nix    # エントリポイント
│   │   ├── defaults.nix   # macOS System Settings
│   │   └── services.nix   # Karabiner-Elements
│   ├── home/
│   │   ├── home.nix       # エントリポイント
│   │   ├── packages.nix   # CLI
│   │   ├── apps.nix       # GUI アプリ
│   │   ├── dotfiles.nix   # symlink 定義
│   │   ├── programs.nix   # git, starship
│   │   └── services.nix   # Hammerspoon
│   ├── overlays/          # nixpkgs に無い Hammerspoon 等
│   └── MIGRATION.md       # 手動移行チェックリスト
├── .config/
├── .bash_profile
└── Makefile
```

## カスタマイズ

- **CLI 追加**: `nix/home/packages.nix`
- **GUI アプリ追加**: `nix/home/apps.nix`（`allowUnfree` 対象あり）
- **macOS 設定変更**: `nix/darwin/defaults.nix`
- **ユーザー名変更**: `flake.nix` の `username`

## 旧 Makefile ベースの install

移行期間中は `make install` も残していますが、新規 Mac では **上記 nix 手順のみ** を使うことを推奨します。
