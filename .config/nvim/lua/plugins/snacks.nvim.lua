return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    image = {
      enabled = true, -- ここをtrueにすることで画像表示が有効になります
    },
    picker = {
      enabled = true,
    },
  },
  keys = {
    { "<leader>z",  function() Snacks.zen.zoom() end,           desc = "Toggle Zoom" },
    { "<leader>gB", function() Snacks.gitbrowse() end,          desc = "Git Browse (GitHub)" },
    { "<leader>gg", function() Snacks.lazygit() end,            desc = "Lazygit" },
    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "[[",         function() Snacks.words.jump(-1) end,       desc = "Prev Reference" },
    { "]]",         function() Snacks.words.jump(1) end,        desc = "Next Reference" },
    { "<leader>sf", function() Snacks.picker.files() end,       desc = "Find Files" },
    { "<leader>sg", function() Snacks.picker.grep() end,        desc = "Grep" },
  },
}
