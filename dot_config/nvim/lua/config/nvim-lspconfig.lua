--------------------
-- nvim-lspconfig -- ------------------

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

    -- virtual-types
    -- require'virtualtypes'.on_attach(client)
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
    virtual_text = {
        source = "always",  -- Or "if_many"
        prefix = '●', -- Could be '■', '▎', 'x'
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
    float = {
        source = "always",  -- Or "if_many"
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
local lsp_path = "/home/sadeli/.local/share/nvim/lsp_servers/"
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {
    bashls = {
        cmd = {lsp_path .. "bashls/node_modules/.bin/bash-language-server", "start"},
        filetypes = {"sh", "zsh"}
    };
    clangd = {
        cmd = {lsp_path .. "clangd/clangd/bin/clangd"}
    },
    cmake = {
        cmd = {lsp_path .. "cmake/venv/bin/cmake-language-server"}
    },
    cssls = {
        cmd = {lsp_path .. "cssls/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server", "--stdio"}
    },
    emmet_ls = {
        cmd = {lsp_path .. "emmet_ls/node_modules/.bin/emmet-ls", "--stdio"}
    },
    golangci_lint_ls = {
        cmd = {lsp_path .. "golangci_lint_ls/golangci-lint-langserver"},
        init_options = {
            command = {lsp_path .. "golangci_lint_ls/golangci-lint","run", "--out-format", "json"}
        }
    },
    gopls = {
        cmd = {lsp_path .. "gopls/gopls"}
    },
    grammarly = {
        cmd = {lsp_path .. "grammarly/node_modules/.bin/unofficial-grammarly-language-server"}
    },
    html = {
        cmd = {lsp_path .. "html/node_modules/.bin/vscode-html-language-server", "--stdio"}
    },
    -- jedi_language_server = {
    --     cmd = {lsp_path .. "jedi_language_server/venv/bin/jedi-language-server"}
    -- },
    pyright = {
        cmd = {lsp_path .. "pyright/node_modules/.bin/pyright-langserver", "--stdio"}
    };
    sumneko_lua = {
        cmd = {"lua-language-server"},
        settings = {
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
                }
            }
        }
    },
    tailwindcss = {
      cmd = {lsp_path .. "/tailwindcss/node_modules/.bin/tailwindcss-language-server", "--stdio"}
    },
    rust_analyzer = {
        cmd = {"rust-analyzer"}
    },
    zk = {
        cmd = {lsp_path .. "zk/zk", "lsp"}
    }
}

for lsp, setup in pairs(servers) do
    setup.on_attach = on_attach
    setup.capabilities = capabilities
    setup.handlers = handlers
    require('lspconfig')[lsp].setup(setup)
end
