" define plugins
call plug#begin('~/.config/nvim/autoload/plugged')

	" colorizer
	Plug 'norcalli/nvim-colorizer.lua' " colors like this #AB1200
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " autocomplete
	Plug 'Yggdroot/indentLine' " line indents
	Plug 'sheerun/vim-polyglot' " language syntax highlighting
	" Plug 'jiangmiao/auto-pairs' " auto pair brackets parens and quotes
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} "markdown preview
	Plug 'lervag/vimtex' " LaTeX syntax plugin
	" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" let g:deoplete#enable_at_startup = 1
	
call plug#end()

" Auto install plugins on startup
autocmd VimEnter *
 \	if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
 \|		PlugInstall --sync | q
 \| endif
