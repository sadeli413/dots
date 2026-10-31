local util = require("config.util")

return {
    server = {
        capabilities = util.capabilities,
        on_attach = util.on_attach,
        handlers = util.handlers,
        cmd = {
            os.getenv("HOME") .. "/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer",
            -- os.getenv("HOME") .. "/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer"
        },
        settings = {
            ["rust-analyzer"] = {
                check = {
                    command = "clippy",
                    extraArgs = { "--", "-Wclippy::pedantic" },
                },
                cargo = {
                    -- extraArgs = { "-Z", "bindeps" },
                    buildScripts = {
                        enable = true,
                    },

                    -- target = "x86_64-pc-windows-gnu",
                    -- target = "thumbv7m-none-eabi",
                    -- features = { "capture-stream" },
                },
                procMacro = {
                    enable = true,
                    ignored = { macro_hell = {"file_test"} },
                },
                -- diagnostics = {
                --     disabled = {
                --         "unresolve-proc-macro",
                --     },
                -- },
            },
        },
    },
}
