return {
  {
    "NeogitOrg/neogit",
    config = true,
    tag = "v0.0.1",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    keys = {
      { "<leader>gg", ":Neogit<CR>", desc = "Neogit toggle" },
    },
  },
}
