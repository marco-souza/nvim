return {
  {
    "marco-souza/term.nvim",
    -- dir = "~/w/marco-souza/term.nvim/",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    cmd = "Term",
    config = true,
    keys = {
      {
        "<leader>tt",
        ":Term open<CR>",
        desc = "Open last session 📝",
      },
      {
        "<leader>tk",
        ":Term k9s<CR>",
        desc = "Open k9s ⚓️",
      },
      {
        "<leader>th",
        ":Term htop<CR>",
        desc = "Open htop 📊",
      },
    },
  },
  {
    "marco-souza/present.nvim",
    -- dir = "~/w/marco-souza/present.nvim/",
    cmd = "Present",
    config = true,
  },
  {
    "marco-souza/rest.nvim",
    -- dir = "~/w/marco-souza/rest.nvim/",
    cmd = "Rest",
    config = true,
    keys = {
      {
        "<leader>r",
        ":Rest<CR>",
        desc = "Open Rest client 🚀",
      },
    },
  },
}
