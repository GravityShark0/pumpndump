local M = {}

local base = '#faf4ed'
local surface = '#fffaf3'
local overlay = '#f2e9e1'
local muted = '#9893a5'
local subtle = '#797593'
local text = '#575279'
local love = '#b4637a'
local gold = '#ea9d34'
local rose = '#d7827e'
local pine = '#286983'
local foam = '#56949f'
local iris = '#907aa9'
local highlight_low = '#f4ede8'
local highlight_med = '#dfdad9'
local highlight_high = '#cecacd'

M.bg_normal = base
M.bg_focus = overlay
M.bg_urgent = love
M.bg_minimize = muted
M.bg_systray = M.bg_normal

M.fg_normal = text
M.fg_focus = pine
M.fg_urgent = rose
M.fg_minimize = text

M.border_normal = highlight_high
M.border_focus = pine
M.border_marked = rose
M.border_scratch = gold

-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- M.taglist_bg_focus = ''
-- M.taglist_bg_urgent = ''
-- M.taglist_bg_occupied = ''
-- M.taglist_bg_empty = ''
-- M.taglist_bg_volatile = ''
--
-- M.taglist_fg_focus = ''
-- M.taglist_fg_urgent = ''
-- M.taglist_fg_occupied = ''
-- M.taglist_fg_empty = ''
-- M.taglist_fg_volatile = ''

-- tasklist_[bg|fg]_[focus|urgent]
-- M.tasklist_bg_focus = ''
-- M.tasklist_bg_urgent = ''
-- M.tasklist_fg_focus = ''
-- M.tasklist_fg_urgent = ''

-- titlebar_[bg|fg]_[normal|focus]
-- M.titlebar_bg_normal = ''
-- M.titlebar_bg_focus = ''
-- M.titlebar_fg_normal = ''
-- M.titlebar_fg_focus = ''

-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- M.tooltip_fg_color = ''
-- M.tooltip_bg_color = ''
-- M.tooltip_border_color = ''

-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- M.mouse_finder_color = ''

-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- M.prompt_fg = ''
-- M.prompt_bg = ''
-- M.prompt_fg_cursor = ''
-- M.prompt_bg_cursor = ''

-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- M.hotkeys_bg = ''
-- M.hotkeys_fg = ''
-- M.hotkeys_border_color = ''
-- M.hotkeys_opacity = ''
-- M.hotkeys_modifiers_fg = ''
-- M.hotkeys_label_bg = ''
-- M.hotkeys_label_fg = ''

-- M.notification_bg = '#cda869'
-- M.notification_fg = '#cda869'

-- M.menu_bg_normal
-- M.menu_bg_focus
-- M.menu_fg_normal
-- M.menu_fg_focus
-- M.menu_border_color

return M
