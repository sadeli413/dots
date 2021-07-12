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

-- Set default pdf viewer to okular for VimTex
vim.g.vimtex_view_general_viwer="okular"

-- Set indent blank lines for indent-blankline
vim.g.indentLinechar="|"

-- Set default web browser for markdown-preview
vim.g.mkdp_browser='firefox'

----------------------
-- Run vim commands --
----------------------

-- Enable syntax highlighting
-- Set colorscheme
-- Run PackerCompile when plugins.lua changes
-- Allow nvim-colorizer to colorize .rasi files
-- Disable comment continuation on new line
-- Automatically apply chezmoi changes
vim.cmd([[
syntax enable
colorscheme toast
autocmd BufWritePost plugins.lua PackerCompile
au BufNewFile,BufRead /*.rasi setf css
au BufWinEnter * set formatoptions-=cro
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %
]])

-------------
-- Plugins --
-------------
require('plugins')
require('require')