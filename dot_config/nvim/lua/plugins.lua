return {
    ---------------
    -- LSP stuff --
    ---------------

    -- Language Server
    { "neovim/nvim-lspconfig" },

    -- Autocompletion
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-calc" },
    { "hrsh7th/cmp-omni" },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.nvim-cmp")
        end
    },

    -- Lsp management
    {
        "williamboman/mason.nvim",
        config = function()
            require("config.mason")
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("config.mason-lspconfig")
        end
    },

    -- luasnip
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },

    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },

    -- Pictograms
    { "onsails/lspkind-nvim" },

    -- lsp colors
    -- { "folke/lsp-colors.nvim" },

    -- Virtual types
    { "jubnzv/virtual-types.nvim" },

    -- Symbols viewer
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup()
        end
    },

    -- List diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Diagnostics with virtual lines
    -- { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

    ----------
    -- Rust --
    ----------
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
    },

    {
        'saecki/crates.nvim',
        tag = 'stable',
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('crates').setup()
        end,
    },

    -- Code actions
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set(
                { "v", "n" },
                "gf",
                require("actions-preview").code_actions
            )
        end,
    },

    -- Progress bar
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end
    },

    ------------
    -- Syntax --
    ------------

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local opts = require("config.treesitter")
            require'nvim-treesitter.configs'.setup(opts)
        end
    },

    -- Rainbow parenthesis
    { "hiphish/rainbow-delimiters.nvim" },

    -------------
    -- Editing --
    -------------

    -- Surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },

    -- XML autotag
    { "windwp/nvim-ts-autotag" },

    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    ----------------
    -- Fuzzy find --
    ----------------
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("config.telescope")
        end
    },

    { "nvim-telescope/telescope-ui-select.nvim" },

    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    },

    --------------
    -- Comments --
    --------------
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require("Comment").setup()
        end
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end
    },

    -------------
    -- Visuals --
    -------------

    -- Colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup()
        end
    },

    -- Colors for hex like this #FFFFFF
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },

    -- Line indentation
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local opts = {
                scope = { enabled = false }
            }
            require("ibl").setup(opts)
        end
    },

    -- Highlight matching words under cursor
    { "RRethy/vim-illuminate" },

    -- Show where the cursor moves in large distances
    {
        "edluffy/specs.nvim",
        config = function()
            require("config.specs")
        end
    },

    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin"
                }
            })
        end
    },

    -----------------
    -- Integration --
    -----------------
    -- Latex
    { "lervag/vimtex" },

    -- Markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -------------------
    -- Miscellaneous --
    -------------------

    -- Shows the next possible keybinding
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("which-key").setup()
        end
    },

    -- File tree explorer
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup()
        end
    },

    -- Tabs
    {
        "romgrk/barbar.nvim",
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
        config = function()
            require("config.barbar")
        end
    },

    -- Notifications
    -- rcarriga/nvim-notify

    -- Yuck syntax
    { "elkowar/yuck.vim" },

    -- Startup
    -- henriquehbr/nvim-startup.lua
    -- Split lines
    -- AndrewRadev/splitjoin.vim
}
