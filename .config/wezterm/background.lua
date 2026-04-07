local wezterm = require 'wezterm'
local background_image = wezterm.home_dir .. "/.config/wezterm/falcon.png"

return {
  {
    source = { File = background_image },
    hsb = {
      brightness = 0.1,
      saturation = 1.0,
      hue = 1.0,
    },
  },
}
