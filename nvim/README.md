# neovim_config

## 設定したキーバインド
### general
| モード | キー | 操作 |
| --- | --- | --- |
| - | スペース | Leaderキー |
| insert | jk | escと同じ（ノーマルモードに戻る） |
| normal | <esc><esc> | 検索ハイライトを消す |
| normal | <cmd>Q | 終了する|


### snack.nvim
| キーバインド | 操作内容 | 説明 |
|---|---|---|
| `<leader>z`      | `Snacks.zen.zoom()`             | トグルズームの切り替え |
| `<leader>gB`     | `Snacks.gitbrowse()`            | GitHubでのGitブラウズ |
| `<leader>gg`     | `Snacks.lazygit()`              | LazyGitの起動 |
| `<leader>n`      | `Snacks.notifier.show_history()`| 通知履歴の表示 |
| `[[`             | `Snacks.words.jump(-1)`         | 前の参照箇所への移動 |
| `]]`             | `Snacks.words.jump(1)`          | 次の参照箇所への移動 |
| `<leader>sf`     | `Snacks.picker.files()`         | ファイル検索 |
| `<leader>sg`     | `Snacks.picker.grep()`          | Grep検索 |

### gx.nvim
| キーバインド | 操作内容 | 説明 |
|---|---|---|
| `gx` | `:Browse` | google検索 |

### lazygit.nvim
| キーバインド | 操作内容 | 説明 |
| --- | --- | --- |
| `<leader>` | `<cmd>LazyGit<cr>` | LazyGitを起動する |

### nvim-possession
| キーバインド | 操作内容 | 説明 |
| --- | --- | --- |
| `<leader>sl` |	セッション一覧表示 |	保存されているセッションをリスト表示し、選択して読み込みます。 |
| `<leader>sn` |	新規セッション作成 |	現在のバッファやレイアウトの状態に名前を付けて新しく保存します。 |
| `<leader>su` |	セッション更新 |	現在開いているセッションの状態を最新の状態に上書き保存します。 |
| `<leader>sd` |	セッション削除 |	不要になったセッションを選択して削除します。 |

### openingh.nvim
| キー操作 | モード | 機能 | 内容 |
| :--- | :---: | :--- | :--- |
| `<Leader>gr` | n | **Open Repo** | GitHubのリポジトリページをブラウザで開く |
| `<Leader>gf` | n | **Open File** | 現在のファイルをGitHubで開く |
| `<Leader>gf` | v | **Open Lines** | 選択した行をGitHubでハイライトして開く |

### other.nvim
| キー操作 | モード | 機能 | 内容 |
| :--- | :---: | :--- | :--- |
| `<leader>oo` | n | **Open Other** | 関連ファイル（例：実装⇔テスト）に切り替える |
| `<leader>ot` | n | **Open Other Tab** | 関連ファイルを新しいタブで開く |



