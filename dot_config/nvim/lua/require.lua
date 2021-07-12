-------------------------------
-- Plugins that need require --
-------------------------------

-- nvim-lspconfig and nvim-lspinstall
require('config/nvim-lspconfig')

-- nvim-compe
require('config/nvim-compe')

-- nvim-colorizer
require'colorizer'.setup()

-- nvim-comment
require('nvim_comment').setup({line_mapping="<C-_>"})

-- nvim-autopairs
require('nvim-autopairs').setup()
require("nvim-autopairs.completion.compe").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true
})
