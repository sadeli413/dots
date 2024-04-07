local util = require("config.util")

local handlers = {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = util.on_attach,
            capabilities = util.capabilities,
            handlers = util.handlers,
        }
    end,

    ['rust_analyzer'] = function() end,

    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
            on_attach = util.on_attach,
            capabilities = util.capabilities,
            handlers = util.handlers,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })
    end,
}

require('mason-lspconfig').setup({handlers = handlers})
