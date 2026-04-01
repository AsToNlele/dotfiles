local pack = require("aston.pack")
local is_macos = vim.loop.os_uname().sysname == "Darwin"

pack.add({
	pack.repo("catppuccin/nvim", { name = "catppuccin" }),
	pack.repo("scottmckendry/cyberdream.nvim"),
	pack.repo("Mofiqul/dracula.nvim"),
	pack.repo("rose-pine/neovim", { name = "rose-pine" }),
	pack.repo("folke/tokyonight.nvim"),
	pack.repo("akai54/2077.nvim"),
	pack.repo("maxmx03/fluoromachine.nvim"),
	pack.repo("oneslash/helix-nvim"),
})

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

require("cyberdream").setup({
	transparent = false,
	italic_comments = false,
	hide_fillchars = false,
	borderless_pickers = true,
	terminal_colors = true,
	variant = "light",
})

require("dracula").setup({
	transparent_bg = true,
})

require("fluoromachine").setup({
	transparent = true,
	glow = false,
})

if not is_macos then
	vim.cmd.colorscheme("catppuccin-latte")
end
