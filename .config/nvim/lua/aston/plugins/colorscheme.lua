local is_macos = vim.loop.os_uname().sysname == "Darwin"

-- current colorscheme is defined in auto-dark-mode.lua as it depends on the macOS color mode
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			local flavour = "latte"
			if is_macos and vim.fn.system("defaults read -g AppleInterfaceStyle") == "Dark\n" then
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

			if not is_macos then
				vim.cmd.colorscheme("catppuccin-latte")
			end
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		priority = 1000,
		opts = {
			transparent = false,
			italic_comments = false,
			-- Replace all fillchars with ' ' for the ultimate clean look
			hide_fillchars = false,
			-- Modern borderless telescope theme
			borderless_pickers = true,
			terminal_colors = true,
			variant = "light",
		},
		config = true,
	},
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		lazy = true,
		priority = 1000,
		opts = {
			transparent_bg = true, -- default false
		},
		config = true,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"akai54/2077.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"maxmx03/fluoromachine.nvim",
		lazy = not is_macos,
		priority = 1000,
		opts = {
			transparent = true,
			glow = false,
		},
		config = true,
	},
}
