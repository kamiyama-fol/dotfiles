return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    -- 1. 隠しファイルを表示する設定
    view_options = {
      show_hidden = true,
    },
    -- 2. キーマップの設定
    keymaps = {
      ["<CR>"] = function()
        local oil = require("oil")
        local entry = oil.get_cursor_entry()

        if not entry then
          return
        end

        -- ディレクトリ（フォルダ）かファイルかで挙動を分岐
        if entry.type == "directory" then
          -- フォルダならそのまま同じ画面で展開
          oil.select()
        else
          -- ファイルなら右側に垂直分割（vsplit）して開く
          oil.select({ vertical = true })
        end
      end,
    },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
