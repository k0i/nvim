local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(client, bufnr)
			require("navigator.lspclient.mapping").setup({ client = client, bufnr = bufnr })
			require("navigator.dochighlight").documentHighlight(bufnr)
			require("navigator.codeAction").code_action_prompt(bufnr)
		end,
		settings = {
			["rust-analyzer"] = {
				cargo = {
					features = "all",
				},
				checkOnSave = true,
				check = {
					command = "clippy",
					features = "all",
				},
				procMacro = {
					enable = true,
				},
			},
		},
	},
})
