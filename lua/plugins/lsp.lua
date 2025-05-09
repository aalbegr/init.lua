return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "ts_ls", "pyright" },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
      -- Disable LSP formatting if using conform.nvim
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      -- Your LSP keymaps here
      local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
      end

      map("n", "gd", vim.lsp.buf.definition)
      map("n", "gD", vim.lsp.buf.declaration)
      map("n", "gr", vim.lsp.buf.references)
      map("n", "gi", vim.lsp.buf.implementation)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "<C-k>", vim.lsp.buf.signature_help)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>ca", vim.lsp.buf.code_action)
      map("n", "<leader>e", vim.diagnostic.open_float)
      map("n", "[d", vim.diagnostic.goto_prev)
      map("n", "]d", vim.diagnostic.goto_next)
    end
    -- Set up each LSP server
    lspconfig.lua_ls.setup({ on_attach = on_attach })
    lspconfig.ts_ls.setup({ on_attach = on_attach })
    lspconfig.pyright.setup({ on_attach = on_attach })
  end,
}
