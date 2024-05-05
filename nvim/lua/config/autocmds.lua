-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("toggle_blame_line"),
  callback = function()
    local gitsigns = require("gitsigns")
    gitsigns.toggle_current_line_blame()
  end,
})
