local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { "eslint", { "prettierd", "prettier" } },
    -- Conform will run multiple formatters sequentially
    go = { "goimports", "gofmt" },
    -- Use the "*" filetype to run formatters on all filetypes.
    ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return {
  "stevearc/conform.nvim",
  event = "LspAttach",
  opts = options,
  keys = {
    { "gf", vim.lsp.buf.format, desc = "Format buffer" },
  },
}
