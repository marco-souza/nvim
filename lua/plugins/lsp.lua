local ensure_installed = {
  -- lua stuff
  "lua-language-server",
  "stylua",

  -- web dev stuff
  "css-lsp",
  "html-lsp",
  "htmx-lsp",
  "typescript-language-server",
  "deno",
  "templ",
  "prettier",
  "emmet_ls",
  "htmx_pls",

  -- rust stuff
  "rustfmt",
  "rust-analyzer",

  -- c/cpp stuff
  "clangd",
  "clang-format",

  -- go suff
  "godoc",
  "gofmt",
  "gofumpt",
  "goimports-reviser",
}

-- if you just want default config for the servers then put them in a table
local lsp_servers = {
  "html",
  "cssls",
  "eslint",
  "clangd",
  "rust_analyzer",
  "emmet_ls",
  "gopls",
  "lua_ls",
  "htmx",
}

local function is_deno_project()
  local files = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true })
  return #files > 0
end

local function setup_js_server()
  local ts_lsp = "denols"
  if not is_deno_project() then
    ts_lsp = "tsserver"
  end

  table.insert(lsp_servers, ts_lsp)
end

local function setup_lsp_mappings()
  -- Global mappings from https://github.com/neovim/nvim-lspconfig
  --
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    end,
  })
end

local function lspconfig_setup()
  local on_attach = require("nvchad.configs.lspconfig").on_attach
  local on_init = require("nvchad.configs.lspconfig").on_init
  local capabilities = require("nvchad.configs.lspconfig").capabilities
  local lspconfig = require("lspconfig")
  local util = require("lspconfig/util")

  setup_js_server()

  local configs = {
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

  for _, lsp in ipairs(lsp_servers) do
    local config = configs[lsp] or {}
    config.on_attach = on_attach or {}
    config.on_init = on_init or {}
    config.capabilities = capabilities or {}

    lspconfig[lsp].setup(config)
  end

  setup_lsp_mappings()
end

return {
  "neovim/nvim-lspconfig",
  config = lspconfig_setup,
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = true,
      opts = {
        automatic_installation = true,
        ensure_installed = ensure_installed,
      },
    },
  },
}
