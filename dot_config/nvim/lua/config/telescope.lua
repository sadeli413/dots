local opts = {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown()
    }
  }
}

require("telescope").setup(opts)
require("telescope").load_extension("ui-select")
