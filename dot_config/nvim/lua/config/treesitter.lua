require'nvim-treesitter.configs'.setup {
    -- Highlight
    highlight = {
        enable = true,
        custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            -- ["foo.bar"] = "Identifier",
        },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
    },

    -- Incremental selection
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    -- nvim-ts-rainbow
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {
            "#ede1f5",
            "#A2EFFD",
            "#E9EB9E",
            "#D46CA5",
            "#A39AE8",
            "#F7B1F9",
            "#72E2C1"
        }, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    -- nvim-ts-autotag
    autotag = {
        enable = true,
    }
}

-- folding
-- zc to close. zo to open
vim.o.foldminlines=5
vim.o.foldlevel=3
vim.o.foldnestmax =3
vim.o.foldmethod='expr'
vim.o.foldexpr='nvim_treesitter#foldexpr()'
vim.o.foldcolumn='2'
