---@diagnostic disable: unused-local
local wezterm = require("wezterm")

local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#d5c4a1"
  local foreground = "#282828"
  local pane = tab.active_pane

  if tab.is_active then
    background = "#448488"
  elseif hover then
    background = "#d79920"
  end

  local title = ""

  if tab.active_pane.is_zoomed then
    title = string.format(" <> " .. (tab.tab_index + 1) .. ":" .. basename(pane.foreground_process_name) .. " ")
  else
    title = string.format(" " .. (tab.tab_index + 1) .. ":" .. basename(pane.foreground_process_name) .. " ")
  end

  return {
    { Background = { Color = "#282828" } },
    { Foreground = { Color = "#282828" } },
    { Text = " " },
    { Attribute = { Intensity = "Bold" } },
    { Attribute = { Italic = false } },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)
