-- Custom keybinds
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-s>', ':SymbolsOutline<CR>', { silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Esc>A;<Esc>', {silent = true, noremap = true})

-- vim-illuminate
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})

-- trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})

-- Comment.nvim
vim.keymap.set('n', '<C-/>', '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>')
vim.keymap.set('n', '<C-\\>', '<cmd>lua require("Comment.api").toggle_current_blockwise()<CR>')
vim.keymap.set('x', '<C-/>', '<Esc><cmd>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
