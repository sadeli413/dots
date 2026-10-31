vim.api.nvim_set_keymap("n", "<Space>s", ":AerialToggle<CR>", { silent = true, noremap = true })

-- Nvim Tree
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

-- vim-illuminate
vim.api.nvim_set_keymap("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
vim.api.nvim_set_keymap(
    "n",
    "<a-p>",
    '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
    { noremap = true }
)

-- Comment.nvim
vim.keymap.set("n", "<C-/>", "<Plug>(comment_toggle_linewise_current)")
vim.keymap.set("x", "<C-/>", "<Plug>(comment_toggle_linewise_visual)")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})

--
vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", {})
