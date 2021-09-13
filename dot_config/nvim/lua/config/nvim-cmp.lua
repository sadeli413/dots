local cmp = require('cmp')
    cmp.setup {
    snippet = {
        expand = function(args)
            -- You must install `vim-vsnip` if you use the following as-is.
            vim.fn['vsnip#anonymous'](args.body)
        end
    },

    -- You can set mapping if you want.
    mapping = {
        -- ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<S-tab>'] = cmp.mapping.select_prev_item(),
        -- ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<tab>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },

    -- You should specify your *installed* sources.
    sources = {
        { name = 'buffer' },
    },
}

-- vim.cmd([[
-- autocmd FileType lua lua require'cmp'.setup.buffer { sources = { { name = 'buffer' }, { name = 'nvim_lua' }, { name = 'path' } }, }
-- ]])
-- require'cmp'.setup {

-- }