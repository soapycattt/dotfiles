-- Split panes
vim.keymap.set("n", "<C-w>h", "<cmd>split<CR>") --split vertically

-- Quick access
vim.keymap.set("n", "<leader>oz", "<cmd>edit ~/.zshrc<cr>", { desc = "Open .zshrc" })

local vscode = require("vscode")
