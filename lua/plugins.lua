return {
	{
		"shaunsingh/moonlight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme moonlight]])
			vim.cmd([[highlight Normal ctermbg=NONE guibg=NONE]])
			vim.cmd([[highlight NonText ctermbg=NONE guibg=NONE]])
			vim.cmd([[highlight LineNr ctermbg=NONE guibg=NONE]])
			vim.cmd([[highlight Folded ctermbg=NONE guibg=NONE]])
			vim.cmd([[highlight EndOfBuffer ctermbg=NONE guibg=NONE]])
			vim.g.aurora_italic = true
			vim.g.aurora_transparent = true
			vim.g.aurora_bold = true
			vim.g.moonlight_italic_comments = true
			vim.g.moonlight_italic_keywords = true
			vim.g.moonlight_italic_functions = true
			vim.g.moonlight_italic_variables = false
			vim.g.moonlight_contrast = true
			vim.g.moonlight_borders = false
			vim.g.moonlight_disable_background = true
			vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#FFFF00" })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })
			vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "magenta" })
			vim.cmd([[highlight CursorLine guibg=#144e52 ctermbg=22]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
		config = function()
			require("config/lualine")
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config/trouble")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config/gitsigns")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("config/nvim-tree")
		end,
	},
	"github/copilot.vim",
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("config/navic")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config/treesitter")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("config/telescope")
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"numToStr/FTerm.nvim",
		config = function()
			require("config/fterm")
		end,
	},
	"wakatime/vim-wakatime",
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.keymap.set("n", "lgt", "<CMD>LazyGit<CR>")
			vim.g["lazygit_floating_window_winblend"] = 0
			vim.g["lazygit_floating_window_use_plenary"] = 0
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
		},
		config = function()
			require("config/cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config/lsp")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("config/formatter")
		end,
	},
	{
		"tamton-aquib/zone.nvim",
		config = function()
			require("config/zone")
		end,
	},
	{
		"tamton-aquib/duck.nvim",
		config = function()
			vim.cmd([[autocmd BufEnter * lua require("duck").hatch("🐤", 15)]])
		end,
	},
	{
		{
			"tomiis4/BufferTabs.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			lazy = false,
			config = function()
				require("config/buffertabs")
			end,
		},
	},
	{
		"folke/flash.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		opts = {
			{
				modes = {
					char = {
						jump_labels = true,
					},
				},
			},
		},
		keys = {
			{
				"e",
				mode = { "n", "o", "x" },
				function()
					require("flash").jump({
						modes = {
							char = {
								jump_labels = true,
							},
						},
					})
				end,
				desc = "Flash Treesitter",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("config/surround")
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("config/notify")
		end,
	},
	{
		"chrisgrieser/nvim-early-retirement",
		config = true,
		event = "VeryLazy",
		opts = {
			retirementAgeMins = 5,
		},
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = {
			"ray-x/navigator.lua",
		},
		config = function()
			require("config/rust-tools")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},
	{
		"mvllow/modes.nvim",
		tag = "v0.2.0",
		config = function()
			require("config/modes")
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = { "lukas-reineke/indent-blankline.nvim" },
		config = function()
			require("config/rainbow-delimiters")
		end,
	},
	{
		"FabianWirth/search.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("config/search")
		end,
	},
	{
		"ray-x/navigator.lua",
		dependencies = {
			{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("config/navigator")
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async", "neovim/nvim-lspconfig" },
		config = function()
			require("config/ufo")
		end,
	},
}
