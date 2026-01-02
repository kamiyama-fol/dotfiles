# neovim_config

## キーバインド
### general
| モード | キー | 操作 |
| --- | --- | --- |
| - | スペース | Leaderキー |
| insert | jk | escと同じ（ノーマルモードに戻る） |
| normal | <esc><esc> | 検索ハイライトを消す |

### snack.nvim
| キーバインド      | 操作内容                         | 説明                             |
|-------------------|----------------------------------|----------------------------------|
| `<leader>z`      | `Snacks.zen.zoom()`             | トグルズームの切り替え          |
| `<leader>gB`     | `Snacks.gitbrowse()`            | GitHubでのGitブラウズ           |
| `<leader>gg`     | `Snacks.lazygit()`              | LazyGitの起動                   |
| `<leader>n`      | `Snacks.notifier.show_history()`| 通知履歴の表示                  |
| `[[`             | `Snacks.words.jump(-1)`         | 前の参照箇所への移動            |
| `]]`             | `Snacks.words.jump(1)`          | 次の参照箇所への移動            |
| `<leader>sf`     | `Snacks.picker.files()`         | ファイル検索                    |
| `<leader>sg`     | `Snacks.picker.grep()`          | Grep検索                        |

### lazygit
| キーバインド      | 操作内容                         | 説明                        |
| --- | --- | ---|
| `<leader>` | `<cmd>LazyGit<cr>` | LazyGitを起動する |


## ディレクトリ構成
```bash:bash
 ~/.config/nvim
❯ tree
.
├── init.lua # nvimを起動した時に実行されるscript
├── lazy-lock.json
├── lua 
│   ├── config
│   │   └── lazy.lua #プラグイン管理するためにプラグイン
│   └── plugins # lazy.nvim
│       ├── completion.lua # 自動補完（hrsh7th/nvim-cmp）
│       ├── filer.lua # ファイラ（stevearc/oil.nvim）
│       ├── finder.lua #検索ツール (folke/snacks.nvim)
│       ├── git.lua #git IDE (kdheepak/lazygit.nvim)
│       ├── language-server.lua # LSP (neovim/nvim-lspconfig)
│       ├── nvim-treesitter.lua # インデントの自動解析ツール (nvim-treesitter/nvim-treesitter),
│       └── vim-rails.lua # rails開発に便利なツール ("tpope/vim-rails")
└── README.md

4 directories, 12 files
```

## 使用プラグイン
- [パッケージ管理]https://github.com/folke/lazy.nvim)
- [ファイラ](https://github.com/stevearc/oil.nvim)
- [ファインダ](https://github.com/folke/snacks.nvim)
- [Language Server](https://github.com/neovim/nvim-lspconfig)
- [LS管理ツール](https://github.com/mason-org/mason.nvim)
- [LS管理ツール2](https://github.com/mason-org/mason-lspconfig.nvim)
- [自動補完エンジン](https://github.com/hrsh7th/nvim-cmp/)
- [Git IDE](https://github.com/kdheepak/lazygit.nvim)

最新の変更は[plugins](https://github.com/kamiyama-fol/neovim_config/tree/main/lua/plugins)を見るとわかる

## 導入方法
### 1. nvimをインストールする
[これ](https://neovim.io/doc/install/)を参考にしてください。
#### apple siliconのmacの場合
```bash
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
tar xzf nvim-macos-arm64.tar.gz

#　$HOMEでlsするたびに出てくると目障りなので隠しファイルにする
mv ./nvim-macos-arm64/ ./.nvim/

echo 'export PATH="$HOME/.nvim/bin:$PATH"' >> ~/.bash_profile
. ~/.bash_profile
```
### 2. .config内にこのリポジトリをcloneする
```bash
# すでに設定ディレクトリがある場合別名に
mv ~/.config/nvim/ ~/.config/nvim_old/

git clone git@github.com:kamiyama-fol/neovim_config.git ~/.config/nvim/
```
