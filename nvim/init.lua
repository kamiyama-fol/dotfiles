vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.helplang = 'ja'
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { silent = true })

-- ==========================================
-- インデントの基本設定
-- ==========================================

-- 改行時に前の行のインデントを継続します
-- 引用元: :help 'autoindent'
vim.opt.autoindent = true

-- C言語に近い言語（Java, Python, Luaなど）で、
-- コードの構造（{ } など）を解釈して賢くインデントします
-- 引用元: :help 'smartindent'
vim.opt.smartindent = true

-- タブ文字（Tabキー）をスペースに変換します
-- 多くのプログラミング言語での推奨設定です
vim.opt.expandtab = true

-- キーボードのTabキーを押した時に入力されるスペースの数
vim.opt.tabstop = 2

-- 自動インデントやコマンド（>>）で操作される際のインデントの幅
vim.opt.shiftwidth = 2

-- タブや改行などの不可視文字を表示して、インデントのズレを確認しやすくします
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained", "BufEnter" }, {
	pattern = "*",
	command = "checktime",
})
