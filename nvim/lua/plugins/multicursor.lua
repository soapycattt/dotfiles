return {
  "mg979/vim-visual-multi",
  init = function()
    vim.keymap.set("n", "<M-d>", "<Plug>(VM-Find-Under)")
    vim.keymap.set("v", "<M-d>", "<Plug>(VM-Find-Subword-Under)")
  end,
}
