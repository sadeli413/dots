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

    -- Language Server Installation
    use 'kabouzeid/nvim-lspinstall'

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
    use 'jubnzv/virtual-types.nvim'

    -- Syntax --
    ------------
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

    -- Comment toggle
    use 'terrortylor/nvim-comment'

    -- Line indentation
    use 'lukas-reineke/indent-blankline.nvim'

    -- Auto pairs
    use 'windwp/nvim-autopairs'

    -- Underline words under cursor
    use 'xiyaowong/nvim-cursorword'

    -------------
    -- Visuals --
    -------------
    -- use {
    --     'glepnir/galaxyline.nvim',
    --     branch='main',
    --     -- custom statusline
    --     config=function() require'config/eviline' end,
    --     -- optional icons
    --     requires={'kyazdani42/nvim-web-devicons', opt=true}
    -- }

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
