---------------------------
-- Default awesome theme --
---------------------------

-- local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi

local gfs = require('gears.filesystem')
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = 'IosevkaTerm Nerd Font Medium ' .. dpi(12)
theme.border_width = dpi(2)
-- theme.useless_gap = dpi(2)

-- local colors = require('catppuccin-mocha')
local colors = require('rose-pine-dawn')
for index, value in pairs(colors) do
	theme[index] = value
end

-- tooltip_[font|opacity|border_width]
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- prompt_font
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
-- theme.taglist_fg_focus = "#ff0000"
theme.taglist_fg_occupied = theme.fg_light
theme.taglist_fg_empty = theme.bg_normal

-- Generate taglist squares:
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
theme.notification_icon_size = dpi(100)

-- Variables set for theming the menu:
-- menu_border_width
-- theme.menu_submenu_icon = themes_path .. 'default/submenu.png'
theme.menu_height = dpi(35)
theme.menu_width = dpi(200)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
-- theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
-- theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"
--
-- theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
-- theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"
--
-- theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
-- theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
-- theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
-- theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"
--
-- theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
-- theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
-- theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
-- theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"
--
-- theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
-- theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
-- theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
-- theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"
--
-- theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
-- theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
-- theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
-- theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

-- theme.wallpaper = themes_path.."default/background.png"
-- theme.wallpaper = '~/Media/Wallpapers/minimalistic/minimalistic/unicat.png'
-- You can use your own layout icons like this:
-- theme.layout_fairh = themes_path .. 'default/layouts/fairh.png'
theme.layout_fairv = themes_path .. 'default/layouts/fairv.png'
theme.layout_floating = themes_path .. 'default/layouts/floating.png'
theme.layout_magnifier = themes_path .. 'default/layouts/magnifier.png'
-- theme.layout_max = themes_path .. 'default/layouts/max.png'
-- theme.layout_fullscreen = themes_path .. 'default/layouts/fullscreen.png'
theme.layout_tilebottom = themes_path .. 'default/layouts/tilebottom.png'
-- theme.layout_tileleft = themes_path .. 'default/layouts/tileleft.png'
theme.layout_tile = themes_path .. 'default/layouts/tile.png'
-- theme.layout_tiletop = themes_path .. 'default/layouts/tiletop.png'
-- theme.layout_spiral = themes_path .. 'default/layouts/spiral.png'
-- theme.layout_dwindle = themes_path .. 'default/layouts/dwindle.png'
theme.layout_cornernw = themes_path .. 'default/layouts/cornernw.png'
-- theme.layout_cornerne = themes_path .. 'default/layouts/cornerne.png'
-- theme.layout_cornersw = themes_path .. 'default/layouts/cornersw.png'
-- theme.layout_cornerse = themes_path .. 'default/layouts/cornerse.png'

-- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
-- theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
