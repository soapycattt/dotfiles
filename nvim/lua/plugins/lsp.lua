return {
  {
    "neovim/nvim-lspconfig",
  },
  { "tpope/vim-rails" },
  -- lspconfig
  {
    "stevearc/conform.nvim",
    event = "BufReadPre",
    format_on_save = function(bufnr)
      -- Disable autoformat on certain filetypes
      -- local ignore_filetypes = { "javascript", "typescript", "vue", "ruby", "markdown", "dockerfile" }
      -- if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      --   return
      -- end

      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      return { timeout_ms = 500, lsp_fallback = false }
    end,
  },
  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "ansible-lint",
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  {
    "DNLHC/glance.nvim",
    opts = {
      preview_win_opts = { relativenumber = false },
      theme = { enable = true, mode = "darken" },
    },
  },
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    opts = {
      autocmd = { enabled = true },
      sign = { enabled = false },
      float = { enabled = true, win_opts = { border = "none" } },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    config = function(_, opts)
      require("inc_rename").setup(opts)
    end,
  },
}
