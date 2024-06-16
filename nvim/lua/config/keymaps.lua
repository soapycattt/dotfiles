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

-- Copy current filepath to clipboard
vim.keymap.set("n", "<leader>cbr", function()
  vim.fn.setreg("+", vim.fn.expand("%:p:."))
end, { noremap = true, silent = true, desc = "[C]lip[B]oard [R]elative Path" })

vim.keymap.set("n", "<leader>cba", function()
  local abs_file_path = vim.fn.expand("%:p:h") .. "/" .. vim.fn.expand("%:t")
  vim.fn.setreg("+", abs_file_path)
end, { noremap = true, silent = true, desc = "[C]lip[B]oard [A]bsolute Path" })

vim.keymap.set("n", "<leader>cbc", function()
  vim.fn.setreg("+", vim.fn.getcwd())
end, { noremap = true, silent = true, desc = "[C]lip[B]oard [C]urrent Working Directory" })

vim.keymap.set("n", "<leader>cbd", function()
  vim.fn.setreg("+", vim.fn.expand("%:h"))
end, { noremap = true, silent = true, desc = "[C]lip[B]oard [D]irectory" })

vim.keymap.set("n", "<leader>cbf", function()
  vim.fn.setreg("+", vim.fn.expand("%:t:r"))
end, { noremap = true, silent = true, desc = "[C]lip[B]oard [F]ilename" })

-- Quick access
vim.keymap.set("n", "<leader>oz", "<cmd>edit ~/.zshrc<cr>", { desc = "Open .zshrc" })
