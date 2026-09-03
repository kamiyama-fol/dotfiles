-- キーを途中まで押すと、続きの候補と説明をポップアップ表示する
-- 各キーマップの desc をそのまま拾うので、これが実質「生きているマニュアル」になる
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    -- <leader> プレフィックスのグループ名（README.md の見出しと対応）
    spec = {
      { "<leader>f", group = "検索 (Telescope)" },
      { "<leader>g", group = "Git / GitHub" },
      { "<leader>r", group = "Grep & 置換 (grug-far)" },
      { "<leader>s", group = "検索 / セッション" },
      { "<leader>o", group = "関連ファイル (other.nvim)" },
      { "<leader>c", group = "パスをコピー" },
    },
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "バッファ内のキーマップ一覧",
    },
    {
      "<leader>K",
      function() require("which-key").show({ global = true }) end,
      desc = "全キーマップ一覧 (which-key)",
    },
  },
}
