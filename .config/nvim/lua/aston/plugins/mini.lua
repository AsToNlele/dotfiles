return {
	{
		-- Text objects
		"echasnovski/mini.ai",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		-- Autopairs
		"echasnovski/mini.pairs",
		version = false,
		event = "InsertEnter",
		config = function()
			require("mini.pairs").setup()
		end,
	},
}
