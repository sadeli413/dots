vim.api.nvim_set_keymap("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
-- Only set if you have telescope installed
-- vim.api.nvim_set_keymap("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", {noremap=true})

local goto_preview = require'goto-preview'
goto_preview.setup({
    width = 120; -- Width of the floating window
    height = 15; -- Height of the floating window
    default_mappings = false; -- Bind default mappings
    debug = false; -- Print debug information
    opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
    post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
})

