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

-- Set menuone and noselect for nvim-compe
vim.o.completeopt="menuone,noselect"

-- temporary fix for indent-blankline
vim.o.colorcolumn="99999"

-- Disable line wrapping
vim.o.wrap=false

-- Turn off showmode
vim.o.showmode=false

-- Keep sign column (gutter) the same width
vim.o.signcolumn='yes'

----------------------
-- Global variables --
----------------------

-- Set default pdf viewer to okular for VimTex
vim.g.vimtex_view_method="general"
vim.g.vimtex_view_general_viewer="okular"
vim.g.vimtex_compiler_progname="nvr"

-- Set indent blank lines for indent-blankline
vim.g.indentLinechar="|"

-- Set default web browser for markdown-preview
vim.g.mkdp_browser="firefox"

-- Catppuccin settings
require("catppuccin").setup({
    styles = {
        variables = "NONE"
    },
    integrations = {
        lsp_trouble = true,
        which_key = true,
        barbar = true,
        ts_rainbow = true,
    }
})

----------------------
-- Run vim commands --
----------------------

-- Enable syntax highlighting
-- Run PackerCompile when plugins.lua changes
-- Allow nvim-colorizer to colorize .rasi files
-- Disable comment continuation on new line
-- Automatically apply chezmoi changes
-- Set custom vim-illuminate configs
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
]])

-- Plugins
require('require')

-- Keybinds
require('config.keymaps')
