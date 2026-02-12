return {
  'akinsho/toggleterm.nvim',
  version = '*', -- Use the latest version
  config = function()
    require('toggleterm').setup({
      -- your configuration comes here
      -- size can be specified as percentage or fixed number
      size = 20,
      open_mapping = [[<C-\>]], -- mapping to toggle the terminal
      direction = 'horizontal', -- direction of the terminal (horizontal, vertical, float)
      shade_terminals = true,
      hide_numbers = true,
      insert_mappings = true, -- go into insert mode once the terminal is open
      terminal_mappings = true, -- allows mappings in terminal mode
      start_in_insert = true,
      close_on_exit = true, -- close the terminal window when the process exits
      -- other options can be found in the github readme
    })

    -- You can also create specific terminals for tools like lazygit
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = 'lazygit',
      direction = 'float',
      hidden = true,
    })

    -- Set a keymap to toggle the specific lazygit terminal
    vim.keymap.set({ 'n', 't' }, '<C-g>', function()
      lazygit:toggle()
    end, { desc = 'Toggle Lazygit (float)' })
  end,
}
