# 端末交換時に手動で移行が必要なもの

nix では管理できない（またはセキュリティ上 git 管理しない）項目のチェックリストです。

## 必須（開発に影響）

- [ ] `~/.ssh/` — SSH 鍵（`ssh-copy-id` または IT 経由）
- [ ] `~/.config/gh/hosts.yml` — GitHub 認証（`gh auth login` または旧端末からコピー）
- [ ] `.config/gh/hosts.yml.example` を参照

## 会社端末（IT 管理・手動インストール）

- GlobalProtect VPN
- EDR / セキュリティエージェント
- その他 MDM で配布されるアプリ

## nixpkgs に無いアプリ（必要なら手動）

| アプリ | 備考 |
|--------|------|
| Cursor | 公式サイトからインストール |
| Docker Desktop | 公式サイト（`docker` CLI は別途 nix 化可） |
| Clipy | App Store / GitHub Releases |
| Alfred | 公式サイト |
| Postico / Postico 2 | App Store |
| Claude Desktop | 公式サイト |

## 移行後の確認

```bash
darwin-rebuild switch --flake ~/dotfiles#macos
which wezterm gh nvim
open -a WezTerm
open -a "Karabiner-Elements"
open -a Hammerspoon
gh auth status
ssh -T git@github.com
```
