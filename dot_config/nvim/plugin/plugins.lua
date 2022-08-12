-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ---------------
    -- LSP stuff --
    ---------------

    -- Language Server
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-omni'

    -- luasnip
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- LSP signature help
    use 'ray-x/lsp_signature.nvim'

    -- Pictograms
    use 'onsails/lspkind-nvim'

    -- LSP colors
    use 'folke/lsp-colors.nvim'

    -- Virtual types
    use 'jubnzv/virtual-types.nvim'

    -- Symbols viewer
    use 'simrat39/symbols-outline.nvim'

    -- List diagnostics
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- Diagnostics with virtual lines
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

    -- Rust
    use {
        'simrat39/rust-tools.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'mfussenegger/nvim-dap'},
        }
    }

    use {
        'saecki/crates.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Code actions
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu'
    }

    -- lsp progress
    use 'j-hui/fidget.nvim'

    ------------
    -- Syntax --
    ------------

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Surround
    use 'tpope/vim-surround'
    -- use 'echasnovski/mini.nvim'
    -- use {
    --     "blackCauldron7/surround.nvim",
    --     config = function()
    --         require"surround".setup {mappings_style = "sandwich"}
    --     end
    -- }

    -------------
    -- Editing --
    -------------

    -- XML and HTML autotag
    use 'windwp/nvim-ts-autotag'

    -- goto preview
    use 'rmagatti/goto-preview'

    -- Auto pairs
    use 'windwp/nvim-autopairs'

    -- Rainbow parentheses
    use 'p00f/nvim-ts-rainbow'

    -----------
    -- Color --
    -----------

    -- Colors for hex like this #FFFFFF
    use 'norcalli/nvim-colorizer.lua'

    ------------
    -- Indent --
    ------------

    -- Line indentation
    use 'lukas-reineke/indent-blankline.nvim'

    ------------
    -- Cursor --
    ------------

    use 'RRethy/vim-illuminate'

    -- Show where cursor moves in large distances
    use 'edluffy/specs.nvim'

    -- use {
    --     'nvim-telescope/telescope.nvim',
    --     requires = { {'nvim-lua/plenary.nvim'} }
    -- }

    --------------
    -- Comments --
    --------------

    -- Comment toggle
    use 'numToStr/Comment.nvim'

    -- Fancy TODO: comments
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -------------
    -- Visuals --
    -------------
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt=true}
    }
    use 'kyazdani42/nvim-web-devicons'

    use 'yashguptaz/calvera-dark.nvim'

    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }

    ---------------------
    -- Integration --
    ---------------------

    -- LaTeX
    use 'lervag/vimtex'

    -- Markdown preview
    use {
        'iamcco/markdown-preview.nvim',
        run=[[sh -c 'cd app && yarn install']],
    }

    ----------------
    -- Keybinding --
    ----------------
    use 'folke/which-key.nvim'

    -------------------
    -- File Explorer --
    -------------------
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazda/nvim-web-devicons'
    }

    -------------
    -- Tabline --
    -------------
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -------------
    -- Utility --
    -------------
    -- Notifications
    use 'rcarriga/nvim-notify'

    ----------
    -- Yuck --
    ----------
    use 'elkowar/yuck.vim'

    -------------
    -- Startup --
    -------------
    -- Display neovim startup time
    -- use 'henriquehbr/nvim-startup.lua'

    -- Improve startup time
    -- use 'lewis6991/impatient.nvim'

    -- Other
    use 'AndrewRadev/splitjoin.vim'

end)
