-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Resize panes
-- vim.keymap.del("n", "<C-Up>")
-- vim.keymap.del("n", "<C-Down>")
-- vim.keymap.del("n", "<C-Left>")
-- vim.keymap.del("n", "<C-Right>")

vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", { remap = true })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "_", "<cmd>resize +2<CR>")
vim.keymap.set("n", "+", "<cmd>resize -2<CR>")

-- vim.keymap.set("i", "<C-j>", "<Down>", { remap = true })
-- vim.keymap.set("i", "<C-k>", "<Up>", { remap = true })
