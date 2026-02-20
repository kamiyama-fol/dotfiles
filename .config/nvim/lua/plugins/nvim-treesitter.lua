return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  -- opts に設定内容を書くと、内部で自動的に setup() を呼んでくれます
  opts = {
    ensure_installed = {
      "ruby",
      "embedded_template",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "typescript",
      "python",
      "go",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  -- optsを使う場合、config関数の記述は不要（省略可能）になります
}