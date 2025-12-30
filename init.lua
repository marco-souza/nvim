---@alias NeovimDistro "mini" | "main" | "lazy"

---@type NeovimDistro
local version = os.getenv("DISTRO") or "lazy"

if version == "mini" then
  return require("distros.mini")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local spec = {
  { import = "plugins" },
}

if version == "lazy" then
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- add user plugins
    { import = "lazy_plugins" },
  }
end

-- nvim startup
require("options")
require("mappings")

-- startup scratch
require("lazy").setup({
  spec = spec,
  defaults = { lazy = true },
})
