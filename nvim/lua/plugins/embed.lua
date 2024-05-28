return {
  {
    "glacambre/firenvim",
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end,

    config = function()
      vim.g.firenvim_config = {
        globalSettings = { alt = "all" },
        localSettings = {
          [".*"] = {
            cmdline = "neovim",
            content = "text",
            priority = 0,
            selector = 'textarea, div[role="textbox"]',
            takeover = "never",
          },
        },
      }
    end,
  },
  {
    "subnut/nvim-ghost.nvim",
    config = function()
      vim.g.nvim_ghost_server_port = 4001
    end,
  },
  -- {
  --   "3rd/image.nvim",
  --   config = function()
  --     require("image").setup()
  --   end,
  -- },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
      -- "3rd/image.nvim",
    },
    opts = {
      lang = "python",
      ---@type boolean
      image_support = true,
    },
  },
}
