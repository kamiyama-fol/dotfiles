# 端末交換時に手動で移行が必要なもの

nix では管理できない（またはセキュリティ上 git 管理しない）項目のチェックリストです。

## 必須（開発に影響）

- [ ] `~/.ssh/` — SSH 鍵（`ssh-copy-id` または IT 経由）
- [ ] `~/.config/gh/hosts.yml` — GitHub 認証（`gh auth login` または旧端末からコピー）
- [ ] `.config/gh/hosts.yml.example` を参照
- [ ] Claude Code — `claude login`（認証は git 管理外。`settings.json` のみ dotfiles で復元）

### Claude Code

dotfiles で管理するもの:

| ファイル | 内容 |
|----------|------|
| `.claude/settings.json` | 権限許可・sandbox ドメイン設定 |
| `.config/git/ignore` | Claude 生成物の git 除外 |

git 管理しないもの（新端末で再生成）:

- `~/.claude.json` — 認証・MCP・履歴（`claude login` で復元）
- `~/.claude/settings.local.json` — 端末固有の上書き
- `~/.claude/history.jsonl`, `projects/`, `cache/` — 実行時データ

```bash
# 初回のみ
claude login
```

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
| Hammerspoon | 公式サイト（/Applications にインストール） |
| Obsidian | App Store / 公式サイト（nixpkgs ビルド不安定のため手動） |
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
