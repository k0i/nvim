require("FTerm").setup({
	border = "double",
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
	blend = 30,
})

vim.keymap.set("n", "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>')
