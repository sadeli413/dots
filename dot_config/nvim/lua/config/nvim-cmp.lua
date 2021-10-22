local cmp = require('cmp')
cmp.setup {
    -- ... Your other configuration ...
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<C-Space>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select=true }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'vsnip' },
        { name = 'nvim_lsp' }
    },

    -- ... Your other configuration ...
    experimental = {
        ghost_text = true
    }
}

-- lspkind-nvim
local lspkind = require('lspkind')
cmp.setup {
    formatting = {
        format = lspkind.cmp_format({with_text = true, maxwidth = 50})
    }
}
