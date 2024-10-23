return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    config = function()
      require("obsidian").setup({
        workspaces = {
          { name = "notes", path = "~/w/marco-souza/notes" },
        },
        follow_url_func = function(url)
          -- Open the URL in the default web browser.
          vim.fn.jobstart({ "open", url }) -- Mac OS
        end,
      })

      -- obsidian
      vim.opt_local.conceallevel = 2
    end,
    -- lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
  },
}
