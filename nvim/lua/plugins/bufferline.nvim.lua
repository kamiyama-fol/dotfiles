return {
  {
    "akinsho/bufferline.nvim",
    version = "*", -- 最新の安定版を使用することを推奨
    dependencies = "nvim-tree/nvim-web-devicons", -- アイコン表示のための依存プラグイン
    config = function()
      -- bufferlineのセットアップ開始
      require("bufferline").setup({
        options = {
          -- モードの指定。ここでは「buffers（開いているファイル）」を表示
          mode = "buffers", 
          -- アイコンを表示するかどうか
          offsets = {
            {
              filetype = "NvimTree", -- サイドバー（例：NvimTree）がある場合に重ならないよう調整
              text = "File Explorer",
              text_align = "left",
              separator = true,
            }
          },
          -- 常にバッファの番号を表示（切り替え時に便利です）
          numbers = "ordinal",
          -- 閉じボタンの表示
          show_buffer_close_icons = true,
          show_close_icon = true,
        },
      })

      -- キーバインド（ショートカットキー）の設定
      -- Shift + h / l で左右のバッファに素早く移動できるようにします
      vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "前のバッファへ" })
      vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "次のバッファへ" })
    end,
  },
}
