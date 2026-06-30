return {
  "gaoDean/autolist.nvim",
  ft = { "markdown" },
  config = function()
    require("autolist").setup()

    -- Enterでリストを継続、空行でリストを終了
    vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>", { buffer = false })
    -- Tab/Shift+Tabでインデントレベルを変更
    vim.keymap.set("i", "<Tab>", "<Tab><cmd>AutolistRecalculate<cr>", { buffer = false })
    vim.keymap.set("i", "<S-Tab>", "<S-Tab><cmd>AutolistRecalculate<cr>", { buffer = false })
  end,
}
