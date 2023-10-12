local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local helper = require("helper")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local pallete = require("theme.pallete")

-- Create a button widget
local rofi_button = wibox.widget {
    {
        text = " 󰞦 ",
        widget = wibox.widget.textbox
    },
    widget = wibox.container.background
}

rofi_button:connect_signal("button::press", function()
    awful.spawn("rofi -show drun")
end)

awful.widget.watch(rofi_button, 1)

local rofi_boxed = helper.box_widget({
    widget = rofi_button,
    bg_color = beautiful.module_bg,
    margins = dpi(6),
})

return rofi_boxed
