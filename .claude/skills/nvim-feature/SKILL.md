---
name: nvim-feature
description: このdotfilesのNeovim設定にプラグインやキーマップを追加・変更するときに使う。lazy.nvimのプラグイン仕様を追加し、キーマップに必ずdescを付け、.config/nvim/README.md のチートシートを同じフォーマットで更新し、動作確認してコミットするまでの一連の手順。「nvimにプラグイン追加」「キーバインド追加」「nvimの設定変更」などで起動。
---

# Neovim 機能追加 → マニュアル更新

このリポジトリの Neovim 設定（`.config/nvim/`）は **lazy.nvim + 1プラグイン1ファイル** 構成。
機能を足したら `.config/nvim/README.md` のチートシートも必ず同じ手順で更新する。

## 対象ファイル

| 何を | どこに |
|---|---|
| プラグイン仕様 | `.config/nvim/lua/plugins/<name>.nvim.lua`（1プラグイン1ファイル、`return { ... }`） |
| グローバルなキーマップ・オプション | `.config/nvim/init.lua` |
| LSP アタッチ時のみのキーマップ | `.config/nvim/lua/plugins/nvim-lspconfig.lua` の `LspAttach` autocmd |
| filetype 限定のキーマップ | プラグインの `ft = {...}` + `config` 内、または `after/ftplugin/` |
| チートシート | `.config/nvim/README.md` |
| which-key のグループ名 | `.config/nvim/lua/plugins/which-key.nvim.lua` の `opts.spec` |

## 手順

### 1. プラグイン仕様を追加する

`.config/nvim/lua/plugins/<name>.nvim.lua` を新規作成。既存ファイル（`oil.nvim.lua`、`grug-far.nvim.lua` など）のスタイルに合わせる：

- 先頭に **日本語コメントで「何のためのプラグインか」** を1〜2行
- `return { "owner/repo", ... }`
- 遅延ロード可能なら `event` / `cmd` / `ft` / `keys` を指定。ファイラや常時使うものは `lazy = false`
- キーマップは原則 `keys = { { "<lhs>", <rhs>, desc = "日本語の説明", mode = {...} } }` で宣言的に書く

### 2. すべてのキーマップに `desc`（日本語）を付ける

which-key がこの `desc` を拾ってライブのマニュアルになる。`desc` の無いキーマップは追加しない。
`vim.keymap.set` を使う場合も第4引数に `{ desc = "..." }` を必ず入れる。

### 3. キーの衝突を確認する

- `<leader>` 配下は名前空間がある: `f`=検索 / `g`=Git / `r`=Grep置換 / `s`=検索・セッション / `o`=関連ファイル / `c`=パスコピー。近いカテゴリの接頭辞に寄せる
- 既存マップと被っていないか `grep -rn "<lhs>" .config/nvim/` で確認
- 新しい `<leader>` グループを作ったら `which-key.nvim.lua` の `opts.spec` にグループ名を追加

### 4. `.config/nvim/README.md` を更新する

- 機能に合うセクションの表に行を追加（無ければセクションを新設）
- 表の形式は `| やりたいこと | キー | VSCodeの対応 |`（VSCode対応が無ければ「なし」）
- プラグインバッファ内だけで効くキー（oil、grug-far など）は、そのプラグイン専用の小見出し＋表にまとめる
- Vim 本体の標準機能なら「Vim / Neovim の標準キー」セクションへ

### 5. 動作確認する

```bash
nvim --headless "+Lazy! sync" +qa
nvim --headless "+checkhealth which-key" +qa   # desc 欠けや衝突の警告を確認
```

対話で `nvim` を開き、`<leader>` を押して which-key に新しいキーが説明付きで出るか目視確認。

### 6. lazy-lock.json を確認してコミットする

- プラグイン追加時は `.config/nvim/lazy-lock.json` の差分も一緒にコミット（`.gitignore` で除外されている場合は設定変更分のみ）
- コミットメッセージは日本語、`gitmessage.txt` のテンプレに沿う
- 例: `nvim: <plugin>を追加し<キー>にマッピング、READMEチートシートを更新`

## チェックリスト

- [ ] `lua/plugins/<name>.nvim.lua` を追加（先頭に日本語コメント）
- [ ] 全キーマップに日本語 `desc`
- [ ] 既存キーとの衝突を grep で確認
- [ ] 新規 `<leader>` グループなら `which-key.nvim.lua` の `spec` に追加
- [ ] `README.md` の該当セクションを同じ表フォーマットで更新
- [ ] `Lazy! sync` と `checkhealth which-key` が通る
- [ ] `<leader>` 押下で which-key に説明付きで出る
- [ ] 日本語コミットメッセージ
