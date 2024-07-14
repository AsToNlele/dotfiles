return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				colorscheme = "mocha",
				transparent_background = true,
			})
			-- vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				-- Enable transparent background
				transparent = false,

				-- Enable italics comments
				italic_comments = false,

				-- Replace all fillchars with ' ' for the ultimate clean look
				hide_fillchars = false,

				-- Modern borderless telescope theme
				borderless_telescope = true,

				-- Set terminal colors used in `:terminal`
				terminal_colors = true,

				theme = {
					variant = "light", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
				},
			})
			-- vim.cmd([[colorscheme cyberdream]])
		end,
	},
	{
		"maxmx03/dracula.nvim",
		name = "dracula",
		priority = 1000,
		config = function()
			require("dracula").setup({
				transparent = true,
			})
			vim.cmd([[colorscheme dracula]])
		end,
	},
}
