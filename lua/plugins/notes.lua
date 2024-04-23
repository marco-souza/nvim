return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        { name = "notes", path = "~/w/marco-souza/notes" },
      },
    },
  },

  {
    "nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/workspace/marco-souza/notes",
            },
          },
        },
      },
    },
  },

  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      local notes_directory = "~/workspace/marco-souza/notes"
      -- Setup orgmode
      require("orgmode").setup({
        org_hide_leading_stars = true,
        org_agenda_files = notes_directory .. "/**/*",
        org_default_notes_file = notes_directory .. "/notes.org",
        org_todo_keywords = { "TODO", "WIP", "|", "DONE", "CANCELED" },
        org_todo_keyword_faces = {
          WIP = ":foreground yellow :weight bold",
          CANCELED = ":foreground red :weight bold :underline on",
          -- TODO = ":background #000000 :foreground red", -- overrides builtin color for `TODO` keyword
        },
      })

      -- NOTE: If you are using nvim-treesitter with `ensure_installed = "all"` option
      -- add `org` to ignore_install
      -- require("nvim-treesitter.configs").setup({
      --   ensure_installed = "all",
      --   ignore_install = { "org" },
      -- })
    end,
  },
}
