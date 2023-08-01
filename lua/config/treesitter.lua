require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["fo"] = "@function.outer",
				["fi"] = "@function.inner",
				["co"] = "@class.outer",
				["ci"] = "@class.inner",
			},
			selection_modes = {
				["@parameter.outer"] = "v",
				["@function.outer"] = "V",
				["@class.outer"] = "<c-v>",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["sw"] = "@parameter.inner",
			},
			swap_previous = {
				["sW"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["ll"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["kk"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["hh"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["jj"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})
