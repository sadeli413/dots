local util = require("config.util")

vim.lsp.config("lua_ls", {
    on_attach = util.on_attach,
    capabilities = util.capabilities,
    update_in_insert = true,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
                -- Don't warn on unused variables starting with _
                unusedLocalExclude = { "_*" },
                neededFileStatus = {
                    ["codestyle-check"] = "Any", -- Code style linting
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            format = {
                enable = true,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

require("mason-lspconfig").setup()
