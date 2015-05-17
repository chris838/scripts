

-----------------------------------------------
-- Set up
-----------------------------------------------

-- local hyper = {"shift", "cmd", "alt", "ctrl"}
local hyper = {"cmd", "ctrl"}


--[[

-----------------------------------------------
-- hyper v for force paste
-----------------------------------------------

hs.hotkey.bind(hyper, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)


-----------------------------------------------
-- hyper d for left one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "d", function()
    local win = hs.window.focusedWindow()
        local f = win:frame()
      local screen = win:screen()
          local max = screen:frame()

    f.x = max.x
        f.y = max.y
      f.w = max.w / 2
          f.h = max.h
        win:setFrame(f)
        end)

-----------------------------------------------
-- hyper g for right one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "g", function()
    local win = hs.window.focusedWindow()
        local f = win:frame()
      local screen = win:screen()
          local max = screen:frame()

    f.x = max.x + (max.w / 2)
        f.y = max.y
      f.w = max.w / 2
          f.h = max.h
        win:setFrame(f)
        end)

-----------------------------------------------
-- hyper f for fullscreen
-----------------------------------------------

hs.hotkey.bind(hyper, "f", function()
    local win = hs.window.focusedWindow()
        local f = win:frame()
      local screen = win:screen()
          local max = screen:frame()

    f.x = max.x
        f.y = max.y
      f.w = max.w
          f.h = max.h
        win:setFrame(f)
        end)

-----------------------------------------------
-- hyper r for top left one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "r", function()
    local win = hs.window.focusedWindow()
        local f = win:frame()
      local screen = win:screen()
          local max = screen:frame()

    f.x = max.x
        f.y = max.y
      f.w = max.w / 2
          f.h = max.h / 2
        win:setFrame(f)
        end)

-----------------------------------------------
-- hyper t for top right one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "t", function()
    local win = hs.window.focusedWindow()
        local f = win:frame()
      local screen = win:screen()
          local max = screen:frame()

    f.x = max.x + (max.w / 2)
        f.y = max.y
      f.w = max.w / 2
          f.h = max.h / 2
        win:setFrame(f)
        end)

-----------------------------------------------
-- hyper v for bottom left one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "v", function()
    local win = hs.window.focusedWindow()
        local f = win:frame()
      local screen = win:screen()
          local max = screen:frame()

    f.x = max.x + (max.w / 2)
        f.y = max.y + (max.h / 2)
      f.w = max.w / 2
          f.h = max.h / 2
        win:setFrame(f)
        end)

-----------------------------------------------
-- hyper c for bottom right one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "c", function()
    local win = hs.window.focusedWindow()
        local f = win:frame()
      local screen = win:screen()
          local max = screen:frame()

    f.x = max.x
        f.y = max.y + (max.h / 2)
      f.w = max.w / 2
          f.h = max.h / 2
        win:setFrame(f)
        end)

--]]

-----------------------------------------------
-- Reload config on write
-----------------------------------------------

function reload_config(files)
    hs.reload()
    end
    hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
    hs.alert.show("Config loaded")


--[[

-----------------------------------------------
-- Hyper i to show window hints
-----------------------------------------------

hs.hints.style = "vimperator"
hs.hotkey.bind(hyper, "i", function()
    hs.hints.windowHints()
    end)

-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------

hs.hotkey.bind(hyper, 'k', function()
    hs.window.focusedWindow():focusWindowNorth()
    end)

hs.hotkey.bind(hyper, 'j', function()
    hs.window.focusedWindow():focusWindowSouth()
    end)

hs.hotkey.bind(hyper, 'l', function()
    hs.window.focusedWindow():focusWindowEast()
    end)

hs.hotkey.bind(hyper, 'h', function()
    hs.window.focusedWindow():focusWindowWest()
    end)

--]]
