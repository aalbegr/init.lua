return {
	"saghen/blink.cmp",
	version = "1.*",

	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },
		signature = { enabled = true },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning", -- Use Rust backend if available
		},
	},

	opts_extend = { "sources.default" },
}
