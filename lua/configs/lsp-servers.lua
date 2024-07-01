local util = require("lspconfig/util")

local M = {}

M.servers = {
  "html",
  "cssls",
  "eslint",
  "clangd",
  "rust_analyzer",
  "tailwindcss",
  "emmet_ls",
  "gopls",
  "lua_ls",
  "htmx",
  "biome",
}

-- setup js server
local ts_lsp = "denols"
local files = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true })

if #files == 0 then
  ts_lsp = "tsserver"
end

table.insert(M.servers, ts_lsp)

-- setup servers configs
M.configs = {
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  },
  eslint = {
    settings = {
      packageManager = "yarn",
    },
  },
  emmet_ls = {
    filetypes = {
      "css",
      "eruby",
      "html",
      "javascript",
      "javascriptreact",
      "less",
      "sass",
      "scss",
      "svelte",
      "pug",
      "typescriptreact",
      "hbs",
      "handlebars",
    },
  },
  html = {
    filetypes = { "html", "hbs", "handlebars" },
  },
  htmx = {
    filetypes = { "html", "tsx", "gotmpl" },
  },
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
            [vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  },
}

return M
