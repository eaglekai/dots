local naughty = require("naughty")
local helper = require("utils.helper")

-- timeout
naughty.config.spacing = 10
naughty.config.defaults.timeout = 0
naughty.config.presets.low.timeout = 6

-- configs
naughty.config.presets.low = {
  font = M.f.body_2,
  fg = M.x.on_surface,
  bg = M.x.dark_primary,
  margin = 14,
  shape = helper.rrect(6),
  border_color = M.x.surface
}

naughty.config.presets.critical = {
  font = M.f.subtile_1,
  fg = M.x.on_surface,
  bg = M.x.error,
  margin = 16,
  shape = helper.rrect(6),
}

naughty.config.presets.info = naughty.config.presets.low

local noti = {}

-- called snackbars in material, low emphasis
-- https://material.io/components/snackbars/#specs
function noti.info(msg)
  naughty.notify({
    text = tostring(msg),
    position = "bottom_middle",
    preset = naughty.config.presets.low
 })
end

function noti.critical(msg)
  naughty.notify({
    title = "Oops, there were errors during startup!",
    text = tostring(msg),
    position = "top_right",
    preset = naughty.config.presets.critical
  })
end

return noti
