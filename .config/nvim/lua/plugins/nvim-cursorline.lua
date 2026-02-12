return {
  'yamatsum/nvim-cursorline',
  opts = {
    cursorline = {
      enable = true,
      timeout = 1000, -- time in ms for cursorline to appear
      number = false, -- highlight line number
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true }, -- highlight style
    },
  },
}
