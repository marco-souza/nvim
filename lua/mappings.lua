require("nvchad.mappings")

local map = vim.keymap.set

-- nvchad
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local opts = { noremap = true, silent = true }

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
-- Close window
map("n", "<leader>x", ":x<CR>", opts)

-- Naviagate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text: https://vim.fandom.com/wiki/Moving_lines_up_or_down

local sally_up = vim.tbl_deep_extend("force", { desc = "Move sally up" }, opts)
local sally_down =
    vim.tbl_deep_extend("force", { desc = "Move sally down" }, opts)

map("n", "<A-j>", ":m .+1<CR>==", sally_up)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", sally_up)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", sally_up)

map("n", "<A-k>", ":m .-2<CR>==", sally_down)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", sally_down)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", sally_down)

-- Toggle checkbox item in markdown

local toggle_checkbox_opts =
    vim.tbl_deep_extend("force", { desc = "Toggle checkbox" }, opts)

local function toggle_checkbox()
  local line = vim.api.nvim_get_current_line()
  local unchecked = "%[ %]"
  local checked = "%[x%]"
  local output = line

  if string.match(line, unchecked) then
    output = string.gsub(line, unchecked, "[x]")
  elseif string.match(line, checked) then
    output = string.gsub(line, checked, "[ ]")
  end

  vim.api.nvim_set_current_line(output)
end

local function v_toggle_checkbox()
  local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]

  for i = start_line, end_line, 1 do
    vim.api.nvim_win_set_cursor(0, { i, 0 })
    toggle_checkbox()
  end
end

map("n", "<C-c><C-c>", toggle_checkbox, toggle_checkbox_opts)
map("v", "<C-c><C-c>", v_toggle_checkbox, toggle_checkbox_opts)
