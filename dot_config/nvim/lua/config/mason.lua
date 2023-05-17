local util = require("config.util")

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Use a loop to conveniently call 'setup' on multiple servers and
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name)
    local setup = {}
    if server_name == "sumneko_lua" or server_name == "lua_ls" then
      setup.settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    elseif server_name == "grammarly" then
      setup.filetypes = { "markdown", "tex" }
    end
    setup.on_attach = util.on_attach
    setup.capabilities = util.capabilities
    setup.handlers = util.handlers
    require("lspconfig")[server_name].setup(setup)
  end
}
