-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Resize panes
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", { remap = true })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "_", "<cmd>resize +2<CR>")
vim.keymap.set("n", "+", "<cmd>resize -2<CR>")

-- Split panes
vim.keymap.set("n", "<C-w>h", "<cmd>split<CR>") --split vertically
