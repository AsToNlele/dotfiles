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
			vim.cmd([[colorscheme catppuccin]])
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
	-- {
	-- 	"maxmx03/dracula.nvim",
	-- 	name = "dracula",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("dracula").setup({
	-- 			transparent = true,
	-- 		})
	-- 		vim.cmd([[colorscheme dracula]])
	-- 	end,
	-- },
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		priority = 1000,
		config = function()
			require("dracula").setup({
				transparent_bg = true, -- default false
			})
			-- vim.cmd([[colorscheme dracula]])
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
}
