-- Based on modus_vivendi.lua
-- https://github.com/hoob3rt/lualine.nvim/blob/master/lua/lualine/themes/modus_vivendi.lua
local colors = {
    black = '#1F1522',
    white = '#ede1f5',
    red = '#D46CA5',
    green = '#72E2C1',
    blue = '#E397F3',
    magenta = '#F7B1F9',
    cyan = '#A2EFFD',
    gray = '#433044',
    darkgray = '#312833',
    lightgray = '#463D48'
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
