-----------------
-- Vim Options --
-----------------

vim.o.encoding="UTF-8"

-- Show relative numberlines instead of absolute
vim.o.relativenumber=true
vim.o.number=true

-- Tab is 4 spaces
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4

-- Express tabs as spaces
vim.o.expandtab=true

-- Use 24 bit colors
vim.o.termguicolors=true

-- Highlight current line
vim.o.cursorline=true

-- Keep cursor in the centor
vim.o.so=999

-- Set cursor shape and rate
vim.o.guicursor="n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

-- Dont hide characters
vim.o.conceallevel=0

-- Set menuone and noselect for nvim-compe
vim.o.completeopt = "menuone,noselect"

----------------------
-- Global variables --
----------------------

-- Set default pdf viewer to okular
vim.g.vimtex_view_general_viwer="okular"

-- Set indent blank lines
vim.g.indentLinechar="|"

----------------------
-- Run vim commands --
----------------------

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- Set colorscheme
vim.cmd("colorscheme toast")

-- Run PackerCompile when plugins.lua changes
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

-- Allow nvim-colorizer to colorize .rasi files
vim.cmd("au BufNewFile,BufRead /*.rasi setf css")

-- Disable comment continuation on new line
vim.cmd("au BufWinEnter * set formatoptions-=cro")

-------------
-- Plugins --
-------------
require('plugins')
require('require')
