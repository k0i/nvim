local search = require("search").setup({})

local builtin = require("telescope.builtin")

require("search").setup({
	append_tabs = {
		{
			"Commits",
			builtin.git_commits,
			available = function()
				return vim.fn.isdirectory(".git") == 1
			end,
		},
	},
})

vim.keymap.set("n", "<C-p>", require("search").open, {})
