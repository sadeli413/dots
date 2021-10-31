local cmp = require('cmp')
cmp.setup({
    -- ... Your other configuration ...
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select=true }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'vsnip' },
        { name = 'nvim_lsp' },
        { name = 'cmdline' },
        { name = 'calc' }
    }, {
        { name = 'buffer' }
    }),

    -- ... Your other configuration ...
    experimental = {
        ghost_text = true
    }
})

-- Use buffer source for '/'.
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use buffer source for '?'.
cmp.setup.cmdline('?', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- lspkind-nvim
local lspkind = require('lspkind')
cmp.setup {
    formatting = {
        format = lspkind.cmp_format({with_text = true, maxwidth = 50})
    }
}

-- nvim-autopairs
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
