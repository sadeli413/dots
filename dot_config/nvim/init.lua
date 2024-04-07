-----------------
-- Vim Options --
-----------------

vim.loader.enable()

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

-- Turn on syntax
vim.o.syntax='on'

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

-- Set menuone and noselect for nvim-cmp
vim.o.completeopt="menu,menuone,noselect"

-- temporary fix for indent-blankline
vim.o.colorcolumn="99999"

-- Disable line wrapping
vim.o.wrap=false

-- Turn off showmode
vim.o.showmode=false

-- Keep sign column (gutter) the same width
vim.o.signcolumn='yes'

-- Disable mouse
vim.o.mouse = ''

-- folding
-- zc to close. zo to open
vim.o.foldminlines=5
vim.o.foldlevel=3
vim.o.foldnestmax =3
vim.o.foldmethod='expr'
vim.o.foldexpr='nvim_treesitter#foldexpr()'
vim.o.foldcolumn='2'

--------------------
-- Plugin manager --
--------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local plugins = require("plugins")
require("lazy").setup(plugins)

vim.cmd.colorscheme "catppuccin"

-- Keybinds
require('config.keymaps')

----------------------
-- Global variables --
----------------------

-- Set default pdf viewer to zathura for VimTex
vim.g.vimtex_view_method="general"
vim.g.vimtex_view_general_viewer="zathura"
vim.g.vimtex_compiler_progname="nvr"

-- Set indent blank lines for indent-blankline
vim.g.indentLinechar="|"

-- Set default web browser for markdown-preview
vim.g.mkdp_browser="librewolf"

-- nvim-tree advises disabling netrw vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.rustaceanvim = require("config.rustaceanvim")

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.soy"},
  command = "setfiletype soy",
})

vim.cmd([[
" Disable comment continuation on newline
au BufWinEnter * set formatoptions-=cro

" Underline instead of highlight for vim-illuminate
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline guibg=NONE
    autocmd VimEnter * hi illuminatedCurWord cterm=underline gui=underline guibg=NONE
augroup END

hi LspReferenceText cterm=underline gui=underline guibg=NONE
hi LspReferenceRead cterm=underline gui=underline guibg=NONE
hi LspReferenceWrite cterm=underline gui=underline guibg=NONE

]])
