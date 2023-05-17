----------------- Vim Options -------------------
vim.o.encoding="UTF-8"

-- Show relative numberlines instead of absolute
vim.o.relativenumber=true
vim.o.number=true

-- Tab is 2 spaces
vim.o.tabstop=2
vim.o.softtabstop=2
vim.o.shiftwidth=2

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

-- nvim-tree advises disabling netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Catppuccin settings
vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup()

----------------------
-- Run vim commands --
----------------------

-- Enable syntax highlighting
-- Run PackerCompile when plugins.lua changes
-- Allow nvim-colorizer to colorize .rasi files
-- Disable comment continuation on new line
-- Automatically apply chezmoi changes
-- Set custom vim-illuminate configs
-- Set nvim-notify colors
vim.cmd([[
colorscheme catppuccin
autocmd BufWritePost plugins.lua PackerCompile
au BufNewFile,BufRead /*.rasi setf css
au BufWinEnter * set formatoptions-=cro
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %

augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline guibg=NONE
    autocmd VimEnter * hi illuminatedCurWord cterm=underline gui=underline guibg=NONE
augroup END

hi LspReferenceText cterm=underline gui=underline guibg=NONE
hi LspReferenceRead cterm=underline gui=underline guibg=NONE
hi LspReferenceWrite cterm=underline gui=underline guibg=NONE

" hi NotifyERRORBorder guifg=#F28FAD
" hi NotifyWARNBorder guifg=#F8BD96
" hi NotifyINFOBorder guifg=#ABE9B3
" hi NotifyDEBUGBorder guifg=#C3BAC6
" hi NotifyTRACEBorder guifg=#6E6C7E
" hi NotifyERRORIcon guifg=#F28FAD
" hi NotifyWARNIcon guifg=#FAE3B0
" hi NotifyINFOIcon guifg=#ABE9B3
" hi NotifyDEBUGIcon guifg=#C3BAC6
" hi NotifyTRACEIcon guifg=#DDB6F2
" hi NotifyERRORTitle  guifg=#F28FAD
" hi NotifyWARNTitle guifg=#FAE3B0
" hi NotifyINFOTitle guifg=#ABE9B3
" hi NotifyDEBUGTitle  guifg=#C3BAC6
" hi NotifyTRACETitle  guifg=#DDB6F2
" hi link NotifyERRORBody Normal
" hi link NotifyWARNBody Normal
" hi link NotifyINFOBody Normal
" hi link NotifyDEBUGBody Normal
" hi link NotifyTRACEBody Normal
]])

-- Plugins
require('require')

-- Keybinds
require('config.keymaps')
