return {
  "neovim/nvim-lspconfig",
  config = function()
    require("configs.lspconfig")
  end,
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      opts = { automatic_installation = true },
    },
  },
}
