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
  keys = {
    { "gD", vim.lsp.buf.references, desc = "Go to References" },
    { "gr", vim.lsp.buf.rename, desc = "Rename symbol" },
  },
}
