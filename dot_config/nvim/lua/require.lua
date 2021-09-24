-------------------------------
-- Plugins that need require --
-------------------------------

-- nvim-lspconfig and nvim-lspinstall
require('config/nvim-lspconfig')

-- nvim-cmp
require('config/nvim-cmp')
require'cmp'.setup {
    sources = {
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp' }
    }
}

-- nvim-colorizer
require'colorizer'.setup()

-- nvim-comment
require('nvim_comment').setup({line_mapping="<C-_>"})

-- nvim-autopairs
require('nvim-autopairs').setup()
require("nvim-autopairs.completion.cmp").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true
})

-- lsp_signature.nvim
require'lsp_signature'.setup()
