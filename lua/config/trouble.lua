require("trouble").setup({
	position = "top",
	height = 20,
})
vim.keymap.set("n", "<leader><leader>e", function()
	require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>.", function()
	require("trouble").next({ skip_groups = true, jump = true })
end)
vim.keymap.set("n", "<leader>,", function()
	require("trouble").previous({ skip_groups = true, jump = true })
end)
