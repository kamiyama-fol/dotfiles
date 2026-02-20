return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8', -- バージョンを指定（推奨）
  dependencies = { 
    'nvim-lua/plenary.nvim',
    -- 検索パフォーマンスを向上させるためのオプション（推奨）
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require('telescope')
    
    -- 基本設定
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            -- 入力モード中のキー操作
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    })

    -- 拡張機能のロード
    telescope.load_extension('fzf')

    -- キーマッピングの設定
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap

    keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    -- keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    -- Git管理下のファイルのみ検索
    keymap.set('n', '<leader>gs', builtin.git_files, { desc = 'Telescope git files' })
  end
}
