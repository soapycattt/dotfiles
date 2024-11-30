return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "ruby",
      "python",
      "css",
      "json",
      "sql",
      "yaml",
      "lua",
      "terraform",
      "go",
    })
  end,
}
