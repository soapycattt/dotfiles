function toggle_transparent(scheme)
  vim.keymap.set("n", "<leader>tt", function()
    local colorscheme = require(scheme)
    if colorscheme == "catppuccin" then
      colorscheme.options.transparent_background = not colorscheme.options.transparent_background
      colorscheme.compile()
    elseif colorscheme == "gruvbox" then
      colorscheme.options.transparent_mode = not colorscheme.options.transparent_mode
    end

    vim.cmd.colorscheme(vim.g.colors_name)
  end, { desc = "[T]oggle [T]ransparent Background" })
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
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
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
    },
    config = function()
      toggle_transparent("gruvbox")
    end,
  },
}
