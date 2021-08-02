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
    use 'hrsh7th/nvim-compe'

    -- nvim-compe dependencies
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    -- LSP signature help
    use 'ray-x/lsp_signature.nvim'

    -------------
    -- Editing --
    -------------

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
