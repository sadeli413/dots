local util = require("config.util")

require("rust-tools").setup({
  tools = {
    inlay_hints = {
      auto = false,
    },
  },
  server = {
    capabilities = util.capabilities,
    on_attach = util.on_attach,
    handlers = util.handlers,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
          -- target = "x86_64-pc-windows-gnu",
        },
        procMacro = {
          enable = true,
        },
        diagnostics = {
          disabled = {
            "unresolve-proc-macro",
          },
        },
      },
    },
  },
})
