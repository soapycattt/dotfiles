return {
  -- change nvim-lspconfig options
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- https://github.com/microsoft/pyright/discussions/5852#discussioncomment-6874502
      ruff_lsp = {},
    },
  },
}
