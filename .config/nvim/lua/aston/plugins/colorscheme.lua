return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			colorscheme = "latte",
			transparent_background = true
		})
		vim.cmd([[colorscheme catppuccin]])
	end,
}
