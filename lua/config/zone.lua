require("zone").setup({
	--style = "epilepsy",
	style = "treadmill",
	after = 200,
	exclude_filetypes = { "TelescopePrompt", "NvimTree", "neo-tree", "dashboard", "lazy" },

	treadmill = {
		direction = "right",
		headache = true,
		tick_time = 30, -- Lower, the faster
	},
	epilepsy = {
		stage = "ictal", -- "aura" or "ictal"
		tick_time = 100,
	},
	dvd = {
		-- text = {"line1", "line2", "line3", "etc"}
		tick_time = 100,
		-- Opts for Dvd style
	},
	-- etc
})
