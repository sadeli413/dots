-------------------------------
-- Plugins that need require --
-------------------------------

-- nvim-lspconfig and nvim-lsp-installer
require('config.nvim-lspconfig')
require("nvim-lsp-installer").settings {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

-- nvim-cmp
require('config.nvim-cmp')

-- goto-preview
require('config.goto-preview')

-- lsp-colors
require('lsp-colors')

-- nvim-colorizer
require'colorizer'.setup()

-- nvim-comment
require('nvim_comment').setup({line_mapping="<C-_>"})

-- nvim-autopairs
require('nvim-autopairs').setup{}

-- lsp_signature.nvim
require'lsp_signature'.setup()

-- nvim-treesitter
require('config.treesitter')

-- lualine.nvim
require('config.peace-lualine')

-- nvim-ts-rainbow
require'nvim-treesitter.configs'.setup {
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
    }
}

-- specs.nvim
require('specs').setup{
    show_jumps = true,
    min_jump = 30,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 10, -- time increments used for fade/resize effects
        blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 20,
        winhl = "PMenu",
        fader = require('specs').linear_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}

-- todo-comments
require("todo-comments").setup {}

-- which-key.nvim
require("which-key").setup {}

-- nvim-tree.lua
require('config.nvim-tree')
