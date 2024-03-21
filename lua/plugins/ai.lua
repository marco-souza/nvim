return {
  {
    "marco-souza/ollero.nvim",
    event = "VeryLazy",
    dependencies = {
      "marco-souza/term.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    dir = "~/workspace/marco-souza/ollero.nvim/",
    opts = {},
  },

  {
    "huggingface/llm.nvim",
    enable = false, -- this is not working yet :(
    build = ":MasonInstall llm-ls", -- ensure llm-ls is installed
    version = "main",
    opts = {
      model = "codellama",
      backend = "ollama",
      url = "http://localhost:11434/api/generate",
      -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
      request_body = {
        model = "gemma",
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
