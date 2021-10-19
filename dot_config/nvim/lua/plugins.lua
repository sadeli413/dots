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

    -- vsnip
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

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
    use {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    }

    -- Colors for hex like this #FFFFFF
    use 'norcalli/nvim-colorizer.lua'

    -- Line indentation
    use 'lukas-reineke/indent-blankline.nvim'

    -- Auto pairs
    use 'windwp/nvim-autopairs'

    -- Underline words under cursor
    use 'xiyaowong/nvim-cursorword'

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
        config = function()
            require("todo-comments").setup {}
        end
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

end)
