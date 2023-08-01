require("neotest").setup({
	adapters = {
		require("neotest-rspec"),
	},
})

vim.keymap.set("n", "<leader>t", require("neotest").run.run(), { silent = true })
