local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local screen = require "mjolnir.screen"
local alert = require "mjolnir.alert"
local tiling = require "mjolnir.tiling"
local hints = require "mjolnir.th.hints"

alert.show("Reloaded Mjolnir config")

local mash = {"ctrl", "cmd"}

-- Window hints
hotkey.bind({"cmd"},"e",hints.windowHints)

-- Automatic window tiling

hotkey.bind(mash, "c", function() tiling.cyclelayout() end)
hotkey.bind(mash, "w", function() tiling.cycle(1) end)
hotkey.bind(mash, "d", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)

tiling.set('layouts', {
  'fullscreen', 'main-vertical', 'main-horizontal'
})

-- Manual window tiling
hotkey.bind(mash, "M", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local primary_screen = screen.mainscreen()
  local max = primary_screen:frame()
  
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setframe(f)
end)

hotkey.bind(mash, "J", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local primary_screen = screen.mainscreen()
  local max = primary_screen:frame()
  
  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setframe(f)
end)

hotkey.bind(mash, "I", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local primary_screen = screen.mainscreen()
  local max = primary_screen:frame()
  
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setframe(f)
end)

hotkey.bind(mash, "L", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local primary_screen = screen.mainscreen()
  local max = primary_screen:frame()
  
  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setframe(f)
end)

hotkey.bind(mash, "K", function()
  local win = window.focusedwindow()
  local f = win:frame()
  local primary_screen = screen.mainscreen()
  local max = primary_screen:frame()
  
  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setframe(f)
end)

hotkey.bind(mash, "R", function()
  mjolnir.reload()
end)