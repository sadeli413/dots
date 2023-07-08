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
    cmd = {
      os.getenv("HOME") .. "/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer"
    },
    settings = {
      ["rust-analyzer"] = {
        check = {
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
