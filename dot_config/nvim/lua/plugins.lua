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
    -- use 'jubnzv/virtual-types.nvim'

    ------------
    -- Syntax --
    ------------
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -------------
    -- Editing --
    -------------

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

    -- todo-comments dep
    -- use {
    --     "folke/trouble.nvim",
    --     requires = "kyazdani42/nvim-web-devicons",
    --     config = function()
    --         require("trouble").setup {}
    --     end
    -- }

    --------------
    -- Comments --
    --------------

    -- Comment toggle
    use 'terrortylor/nvim-comment'

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

    -- use 'yashguptaz/calvera-dark.nvim'

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

    ----------------
    -- Spellcheck --
    ----------------

    use 'lewis6991/spellsitter.nvim'

end)
