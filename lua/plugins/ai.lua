return {
  { "github/copilot.vim", event = "VeryLazy" },

  {
    "David-Kunz/gen.nvim",
    cmd = "Gen",
    opts = { model = "llama3.1" },
  },

  -- setup ollero
  {
    "marco-souza/ollero.nvim",
    event = "VeryLazy",
    opts = { model = "llama3.1" },
    -- dir = "~/w/marco-souza/ollero.nvim/",
    dependencies = {
      "marco-souza/term.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },

  {
    "huggingface/llm.nvim",
    enable = false,                 -- this is not working yet :(
    build = ":MasonInstall llm-ls", -- ensure llm-ls is installed
    version = "main",
    opts = {
      model = "llama3.1:latest",
      backend = "ollama",
      url = "http://localhost:11434/api/generate",
      -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
      request_body = {
        model = "llama3.1",
        -- Modelfile options for the model you use
        options = {
          temperature = 0.2,
          top_p = 0.95,
        },
      },
      tokens_to_clear = { "<EOT>" },
      fim = {
        enabled = true,
        prefix = "<PRE> ",
        middle = " <MID>",
        suffix = " <SUF>",
      },
    },
  },
}
