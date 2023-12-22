require("navigator").setup({
	keymaps = {
		{ key = "<leader>a", func = require("navigator.symbols").document_symbols, desc = "document_symbols" },
		{ key = "<leader>r", func = require("navigator.reference").async_ref, desc = "async_ref" },
		{ key = "<leader>s", func = require("navigator.definition").definition_preview, desc = "definition" },
		{ key = "<leader>h", func = require("navigator.dochighlight").hi_symbol, desc = "hi_symbol" },
		{
			key = "<leader>wa",
			func = require("navigator.workspace").add_workspace_folder,
			desc = "add_workspace_folder",
		},
		{
			key = "<leader>wr",
			func = require("navigator.workspace").remove_workspace_folder,
			desc = "remove_workspace_folder",
		},
		--{ key = "<leader>f", func = vim.lsp.buf.format, mode = "n", desc = "format" },
		--{ key = "<leader>f", func = vim.lsp.buf.range_formatting, mode = "v", desc = "range format" },
		{
			key = "<leader>wl",
			func = require("navigator.workspace").list_workspace_folders,
			desc = "list_workspace_folders",
		},
		{
			key = "<leader><leader>a",
			func = require("navigator.workspace").workspace_symbol_live,
			desc = "workspace_symbol_live",
		},
	},
})
