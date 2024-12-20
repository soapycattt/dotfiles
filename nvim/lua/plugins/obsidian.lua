return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  cmd = {
    "ObsidianNew",
    "ObsidianNewFromTemplate",
  },
  opts = {
    workspaces = {
      {
        name = "vault",
        path = "~/Documents/Persona/Obsidian",
      },
    },
    templates = {
      folder = "~/Documents/Persona/Obsidian/template",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
  },
}
