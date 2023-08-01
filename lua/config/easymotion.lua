vim.keymap.set("n", "f", function()
	return "<Plug>(easymotion-bd-w)"
end, { expr = true, remap = true })
vim.keymap.set("n", "b", function()
	return "<Plug>(easymotion-b)"
end, { expr = true, remap = true })
vim.keymap.set("n", "e", function()
	return "<Plug>(easymotion-lineforward)"
end, { expr = true, remap = true })
