return {
  {
    "epwalsh/obsidian.nvim",
    version      = "*",
    dependencies = { "nvim-lua/plenary.nvim" },

    -- load when you run any Obsidian command or open a .md file
    cmd = {
      "ObsidianOpen",
      "ObsidianToday",
      "ObsidianSearch",
      "ObsidianNew",
    },
    ft = { "markdown" },

    opts = {
      -- must be a list of tables, each with `name` and `path`
      workspaces = {
        {
          name = "personal",
          path = vim.fn.expand("~/Documents/vaults/personal"),
        },
        -- you can add more vaults/projects here:
        -- {
        --   name = "work",
        --   path = vim.fn.expand("~/Documents/vaults/work"),
        -- },
      },
      -- (optional) pick which workspace to open by default
      default_workspace = "personal",
    },
  },

  -- other markdown plugins…
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}

