return {
  {
    "wakatime/vim-wakatime",
    lazy = false,
    build = ":WakaTimeDebugDisable", -- ensure logs are off
  },
  { "nvim-ts-autotag", opts = {} },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
  {
    "dkarter/bullets.vim",
    event = "InsertEnter",
    config = function()
      vim.g.bullets_enabled_file_types = {
        "markdown",
        "text",
        "gitcommit",
        "scratch",
      }
    end,
  },
}
