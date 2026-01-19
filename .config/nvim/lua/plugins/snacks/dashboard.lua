local headers = {
  [[
  ____ ___  ____  _____ 
 / ___/ _ \|  _ \| ____|
| |  | | | | | | |  _|  
| |__| |_| | |_| | |___ 
 \____\___/|____/|_____|
  ]],
  [[
 _   _    _    ____ _  __
| | | |  / \  / ___| |/ /
| |_| | / _ \| |   | ' / 
|  _  |/ ___ \ |___| . \ 
|_| |_/_/   \_\____|_|\_\
  ]],
  [[
 _______  _   _ 
|__  / _|| \ | |
  / /| |_|  \| |
 / /_|  _| |\  |
/____|_| |_| \_|
  ]],
  [[
 _   _                  _
| \ | | ___  _____   __(_)_ __ ___
|  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
| |\  |  __/ (_) \ V / | | | | | | |
|_| \_|\___|\___/ \_/  |_|_| |_| |_|
  ]],
  [[
 ___ ___ ___ __ __ /\_\ ___ ___ 
 / _ `\ / __`\ / __`\/\ \/\ \\/\ \ / __` __`\ 
/\ \/\ \/\ __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
\ \_\ \_\ \____\ \____/\ \___/ \ \_\ \_\ \_\ \_\ 
 \\/_/\/_/\/____/\/___/ \/__/ \\/_/\/_/\/_/\/_/ 
  ]],
}

math.randomseed(os.time())
local header = headers[math.random(#headers)]

return {
  enabled = true,
  sections = {
    { section = "header" },
    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
    { section = "startup" },
  },
  autokeys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
  preset = {
    keys = {
      { icon = "", desc = "New file", key = "e", action = ":enew" },
      { icon = "󰒲", desc = "Lazy", key = "z", action = ":Lazy" },
      { icon = "󰈙", desc = "Oil", key = ".", action = ":Oil" },
      { icon = "", desc = "Dotfiles", key = "d", action = ":lua snacks.dashboard.open_config()" },
      { icon = "󰈙", desc = "Files", key = "f", action = ":Telescope smart_open" },
      { icon = "", desc = "Restore Session", key = "s", section = "session" },
      { icon = "󰅚", desc = "Quit", key = "q", action = ":qa" },
    },
    header = header,
  },
}
