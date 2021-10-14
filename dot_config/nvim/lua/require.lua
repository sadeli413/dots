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
        { name = 'vsnip' },
        { name = 'nvim_lsp' }
    }
}

-- goto-preview
require('config/goto-preview')
require('goto-preview').setup {
    width = 120; -- Width of the floating window
    height = 15; -- Height of the floating window
    default_mappings = false; -- Bind default mappings
    debug = false; -- Print debug information
    opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
    post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
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
