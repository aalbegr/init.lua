return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    format_on_save = false,

    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      python = { "black" },
    },

    -- Formatter-specific options
    formatters = {
      prettier = {
        prepend_args = { "--tab-width", "2", "--use-tabs", "false" },
      },
      stylua = {
        prepend_args = { "--indent-width", "2", "--indent-type", "Spaces" },
      },
      black = {
        prepend_args = { "--line-length", "88" }, -- optional: default is 88
      },
    },
  },
}
