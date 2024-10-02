-- https://github.com/NvChad/ui?tab=readme-ov-file#install
return {
  "nvim-lua/plenary.nvim",

  {
    "nvchad/ui",
    config = function()
      require("nvchad")
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
}
