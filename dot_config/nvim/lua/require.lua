
-------------------------------
-- Plugins that need require --
-------------------------------

-- on_attach and stuff
require('config.util')

-- LSP
require('config.mason')

-- Rust tools
require('config.rust-tools')

-- nvim-cmp
require('config.nvim-cmp')

-- goto-preview
require('config.goto-preview')

-- lsp-colors
require('lsp-colors')

-- nvim-colorizer
require'colorizer'.setup()

-- nvim-autopairs
require('nvim-autopairs').setup{}

-- lsp_signature.nvim
require'lsp_signature'.setup()

-- nvim-treesitter
require('config.treesitter')

-- lualine.nvim
require('lualine').setup {
    options = {
        theme = "catppuccin"
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

-- babar.nvim
require('config.barbar')

-- fidget.nvim
require"fidget".setup{}

-- crates.nvim
require('crates').setup()

require('Comment').setup()

require('symbols-outline').setup()

-- require("lsp_lines").setup()
require('config.comment')

require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown()
    }
  }
}

require("telescope").load_extension("ui-select")
