return {
  "rgroli/other.nvim",
  keys = {
    { "<leader>oo", "<cmd>Other<CR>", desc = "関連ファイルを開く" },
    { "<leader>ot", "<cmd>OtherTab<CR>", desc = "関連ファイルを新しいタブで開く" },
  },
  opts = {
    mappings = {
      "livewire",
      "angular",
      "laravel",
      "rails",
      "golang",
      "python",
      "react",
      "rust",
      "elixir",
      "clojure",
      {
        pattern = "/path/to/file/src/app/(.*)/.*.ext$",
        target = "/path/to/file/src/view/%1/",
        transformer = "lowercase",
      },
    },
    transformers = {
      lowercase = function(inputString)
        return inputString:lower()
      end,
    },
    style = {
      border = "solid",
      seperator = "|",
      width = 0.7,
      minHeight = 2,
    },
  },
}
