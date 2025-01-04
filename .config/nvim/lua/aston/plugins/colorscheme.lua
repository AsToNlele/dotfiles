-- current colorscheme is defined in auto-dark-mode.lua as it depends on the macOS color mode
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local flavour = "latte"
			local apple_interface_style = vim.fn.system("defaults read -g AppleInterfaceStyle")
			if apple_interface_style == "Dark\n" then
				flavour = "mocha"
			end

			require("catppuccin").setup({
				flavour = flavour,
				transparent_background = true,
				color_overrides = {
					latte = {
						base = "#ffffff",
					},
				},
			})
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			italic_comments = false,
			-- Replace all fillchars with ' ' for the ultimate clean look
			hide_fillchars = false,
			-- Modern borderless telescope theme
			borderless_telescope = true,
			terminal_colors = true,
			theme = {
				variant = "auto", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
			},
		},
		config = true,
	},
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		priority = 1000,
		opts = {
			transparent_bg = true, -- default false
		},
		config = true,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},
	{
		"akai54/2077.nvim",
		priority = 1000,
	},
	{
		"maxmx03/fluoromachine.nvim",
		priority = 1000,
		opts = {
			transparent = true,
			glow = false,
		},
		config = true,
	},
}
