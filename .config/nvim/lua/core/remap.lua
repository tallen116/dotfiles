vim.g.mapleader = " "

-- Project View / NetRW
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Keep cursor in the middle when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank but keep current register
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Easy escape
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Insert newlines
vim.keymap.set("n", "<leader>o", '@="m`o\\eg``"<cr>')
vim.keymap.set("n", "<leader>O", '@="m`o\\eg``"<cr>')
