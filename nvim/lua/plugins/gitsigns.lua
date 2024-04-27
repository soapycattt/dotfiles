return {
  -- {
  --   -- Adds git related signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup()

    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
    keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
    --   keymap.set("v", "<leader>hs", function()
    --     gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    --   end)
    --   map("v", "<leader>hr", function()
    --     gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    --   end)
    --   map("n", "<leader>hS", gitsigns.stage_buffer)
    --   map("n", "<leader>hu", gitsigns.undo_stage_hunk)
    --   map("n", "<leader>hR", gitsigns.reset_buffer)
    --   map("n", "<leader>hp", gitsigns.preview_hunk)
    --   map("n", "<leader>hb", function()
    --     gitsigns.blame_line({ full = true })
    --   end)
    keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle Git [B]lame Line" })
    keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "[H]ighlight Git Diff" })
    keymap.set("n", "<leader>hD", function()
      gitsigns.diffthis("~")
    end, { desc = "[H]ighlight Git Diff (Ignore Whitespace)" })
    keymap.set("n", "<leader>td", gitsigns.toggle_deleted, { desc = "[T]oggle [D]eleted" })
    --
    --   -- Text object
    --   map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    -- end,
  end,
}
