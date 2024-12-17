-- reference https://github.com/NvChad/ui?tab=readme-ov-file#install
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "one_light",
  theme_toggle = { "kanagawa", "one_light" },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
