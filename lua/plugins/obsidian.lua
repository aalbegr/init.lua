return {
  -- obsidian
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/vaults/personal",
      },
      --{
      --  name = "work",
      --  path = "~/vaults/work",
      --},
    },
  },

  -- pretty markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
