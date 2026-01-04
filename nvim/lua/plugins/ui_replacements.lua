return {
  -- Notifier
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>n",
        function()
          local ok, telescope = pcall(require, "telescope")
          if ok and telescope.extensions.notify then
             telescope.extensions.notify.notify()
          else
             local history = require("notify").history()
             -- Fallback or basic handling
             vim.cmd("Telescope notify")
          end
        end,
        desc = "Notification History",
      },
    },
    config = function()
        vim.notify = require("notify")
        local ok, telescope = pcall(require, "telescope")
        if ok then
            telescope.load_extension("notify")
        end
    end,
    dependencies = { "nvim-telescope/telescope.nvim" }
  },
  -- Input/Select
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  -- Indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
  -- Scope
  {
      "echasnovski/mini.indentscope",
      version = false, 
      event = { "BufReadPost", "BufNewFile" },
      opts = {},
  },
  -- Scroll
  { 
    "karb94/neoscroll.nvim", 
    event = "VeryLazy",
    opts = {} 
  },
  -- Bigfile
  { "LunarVim/bigfile.nvim", event = "BufReadPre" },
  -- Image
  { 
    "3rd/image.nvim", 
    event = "VeryLazy",
    opts = {
      backend = "kitty", -- WezTermはKitty Graphics Protocolを使用します
      max_width = 100,
      max_height = 12,
      window_overlap_clear_enabled = true, -- ウィンドウが重なった時に画像をクリア
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
    }
  },
}
