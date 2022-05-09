--------------------
-- nvim-lspconfig --
--------------------

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- vim-illuminate
    require 'illuminate'.on_attach(client)
end

-- UI Customization
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

-- LSP settings (for overriding per client)
local handlers =  {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

vim.diagnostic.config({
    virtual_text = {
        source = "always",  -- Or "if_many"
    },
    float = {
        source = "always",  -- Or "if_many"
    },
})

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
    }
})

-- Change diagnostic symbols in the gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    'clangd',
    'cmake',
    'cssls',
    'emmet_ls',
    'golangci_lint_ls',
    'gopls',
    'grammarly',
    'html',
    'rust_analyzer',
    'sumneko_lua',
    'zk'
}

local lsp_path = "/home/sadeli/.local/share/nvim/lsp_servers/"
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(servers) do
    local setup = {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers
    }

    if lsp == "clangd" then
        setup.cmd = {lsp_path .. "clangd/clangd/bin/clangd"}
    end
    if lsp == "cmake" then
        setup.cmd = {lsp_path .. "cmake/venv/bin/cmake-language-server"}
    end
    if lsp == "cssls" then
        setup.cmd = {lsp_path .. "cssls/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server", "--stdio"}
    end
    if lsp == "emmet_ls" then
        setup.cmd = {lsp_path .. "emmet_ls/node_modules/.bin/emmet-ls", "--stdio"}
    end
    if lsp == "golangci_lint_ls" then
        setup.cmd = {lsp_path .. "golangci_lint_ls/golangci-lint-langserver"}
        setup.init_options = {
            command = {lsp_path .. "golangci_lint_ls/golangci-lint", "run", "--out-format", "json"}
        }
    end
    if lsp == "gopls" then
        setup.cmd = {lsp_path .. "gopls/gopls"}
    end
    if lsp == "html" then
        setup.cmd = {lsp_path .. "html/node_modules/.bin/vscode-html-language-server", "--stdio"}
    end
    if lsp == "sumneko_lua" then
        setup.cmd = {"lua-language-server"}
        setup.settings = {
            Lua ={
                diagnostics = {
                    globals = { 'vim' }
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true)
                },
                telemetry = {
                    enable = false,
                },
            },
        }
    end
    if lsp == "zk" then
        setup.cmd = {lsp_path .. "zk/zk", "lsp"}
    end

    require('lspconfig')[lsp].setup(setup)
end
