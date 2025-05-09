return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files)
        vim.keymap.set("n", "<leader>FF",builtin.git_files)
		vim.keymap.set("n", "<leader>fg", builtin.live_grep)
		vim.keymap.set("n", "<leader><leader>", builtin.buffers)
		vim.keymap.set("n", "<leader>fh", builtin.help_tags)
		vim.keymap.set("n", "<leader>ss", builtin.builtin)
		vim.keymap.set("n", "<leader>pw)s", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}
