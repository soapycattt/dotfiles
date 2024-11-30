-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- -- Auto enbale git blame
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   group = augroup("toggle_blame_line"),
--   callback = function()
--     local gitsigns = require("gitsigns")
--     gitsigns.toggle_current_line_blame()
--   end,
-- })

-- Load session on VimEnter if no files are opened and Session.vim exists
vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("sourcesession"),
  nested = true,
  callback = function()
    if vim.fn.argc() == 0 and vim.v.this_session == "" and vim.fn.filereadable("Session.vim") == 1 then
      vim.cmd("source Session.vim")
    end
  end,
})
