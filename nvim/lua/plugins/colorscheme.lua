-- Grubox
-- return {
--   {
--     'ellisonleao/gruvbox.nvim',
--     opts = {
--       transparent_mode = true,
--     },
--   },
--   -- Configure LazyVim to load gruvbox
--   {
--     'LazyVim/LazyVim',
--     opts = {
--       colorscheme = 'gruvbox',
--     },
--   },
-- }

-- Catpuccin
return {
  {
    "catppuccin",
    opts = {
      transparent_background = true,
    },

    config = function()
      vim.keymap.set("n", "<leader>tt", function()
        local cat = require("catppuccin")
        cat.options.transparent_background = not cat.options.transparent_background
        cat.compile()
        vim.cmd.colorscheme(vim.g.colors_name)
      end, { desc = "[T]oggle [T]ransparent Background" })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
