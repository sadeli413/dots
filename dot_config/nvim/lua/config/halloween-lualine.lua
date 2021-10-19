-- Based on modus_vivendi.lua
-- https://github.com/hoob3rt/lualine.nvim/blob/master/lua/lualine/themes/modus_vivendi.lua
local colors = {
    black = '#1e181b',
    white = '#f4e6e1',
    red = '#E6A0AA',
    green = '#82D4BB',
    blue = '#FF9753',
    magenta = '#BE96BD',
    cyan = '#88D1FE',
    gray = '#2E2532',
    darkgray = '#322D30',
    lightgray = '#565154'
}
-- LuaFormatter on
halloween = {
  normal = {
    a = {bg = colors.blue, fg = colors.lightgray, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.blue},
    c = {bg = colors.gray, fg = colors.white}
  },
  insert = {
    a = {bg = colors.cyan, fg = colors.lightgray, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.cyan},
    c = {bg = colors.gray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.magenta, fg = colors.lightgray, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.magenta},
    c = {bg = colors.gray, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.lightgray, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.red},
    c = {bg = colors.gray, fg = colors.white}
  },
  command = {
    a = {bg = colors.green, fg = colors.lightgray, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.green},
    c = {bg = colors.gray, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.lightgray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.lightgray},
    c = {bg = colors.darkgray, fg = colors.lightgray}
  }
}

require'lualine'.setup {
    options = { theme = halloween },
}
