set encoding=utf-8
set relativenumber
set number
syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set termguicolors
set pyx=3
set updatetime=300
set backspace=indent,eol,start
au BufNewFile,BufRead /*.rasi setf css
colorscheme groove

" keep cursor in the centor of the screen
set so=999

" source vim-plug
source $HOME/.config/nvim/vim-plug/plugins.vim " all plugins
source $HOME/.config/nvim/plug-config/coc.vim  " auto-complete
source $HOME/.config/nvim/plug-config/indentLine.vim " line indents
" source $HOME/.config/nvim/plug-config/auto-pairs.vim " bad auto pairs plugin
source $HOME/.config/nvim/plug-config/markdown-preview.vim " markdown preview
" math latex vim. from castel.dev
" Ulti snips

" lua
" colors like this #121212
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
lua require'plug-colorizer'
