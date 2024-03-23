local nvchad_config = require("nvchad.configs.lspconfig")
local lspconfig = require("lspconfig")

local servers = require("configs.lsp-servers").servers
local configs = require("configs.lsp-servers").configs

local on_attach = nvchad_config.on_attach
local on_init = nvchad_config.on_init
local capabilities = nvchad_config.copabilities

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
      vim.keymap.set("n", "gD", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    end,
  })
end

for _, lsp in ipairs(servers) do
  local config = configs[lsp] or {}
  config.on_attach = on_attach or {}
  config.on_init = on_init or {}
  config.capabilities = capabilities or {}

  lspconfig[lsp].setup(config)
end

setup_lsp_mappings()
