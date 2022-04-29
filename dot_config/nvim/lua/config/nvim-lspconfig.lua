-- local nvim_lsp = require('lspconfig')

--------------------
-- nvim-lspconfig --
--------------------

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

    -- ui customization
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
    vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
    vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- vim-illuminate
    require 'illuminate'.on_attach(client)

    -- virtual-types.nvim
    -- require'virtualtypes'.on_attach(client)

    -- Customizing how diagnostics are displayed
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- virtual_text = true,
        virtual_text = {
            prefix = '●', -- Could be '▎', 'x', '■'
        },
        signs = true,
        underline = true,
        update_in_insert = true,
    })

end

-- Change diagnostic symbols in the gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Print diagnostics in the status line
-- function PrintDiagnostics(opts, bufnr, line_nr, client_id)
--     opts = opts or {}
--
--     bufnr = bufnr or 0
--     line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
--
--     local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line_nr, opts, client_id)
--     if vim.tbl_isempty(line_diagnostics) then return end
--
--     local diagnostic_message = ""
--     for i, diagnostic in ipairs(line_diagnostics) do
--         diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
--         print(diagnostic_message)
--         if i ~= #line_diagnostics then
--             diagnostic_message = diagnostic_message .. "\n"
--         end
--     end
--     vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
-- end
--
-- vim.cmd [[ autocmd CursorHold * lua PrintDiagnostics() ]]

-- Show line diagnostics
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- vim.o.updatetime = 100
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

------------------------
-- nvim-lsp-installer --
------------------------
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        -- nvim-cmp
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --      opts.root_dir = function() ... end
    -- end
    if server.name == "grammarly" then
        return
    end

    if server.name == "sumneko_lua" then
        -- opts.cmd = {"/home/sadeli/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/Linux/lua-language-server", "-E", "/home/sadeli/.local/share/nvim/lsp_servers/sumneko_lua/extension/server" .. "/main.lua"}
        opts.cmd = { "lua-language-server" }
        opts.settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true)
                }
            }
        }
    end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
