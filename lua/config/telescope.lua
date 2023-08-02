require("telescope").setup({
	defaults = {
		winblend = 20,
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-g>", builtin.live_grep, {})
vim.keymap.set("n", "<leader><tab>", builtin.buffers, {})
vim.keymap.set("n", "<C-h>", builtin.help_tags, {})
vim.keymap.set("n", "<leader>g", builtin.grep_string, {})
