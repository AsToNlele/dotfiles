local pack = require("aston.pack")

if vim.loop.os_uname().sysname ~= "Darwin" then
	return
end

pack.add({ pack.repo("f-person/auto-dark-mode.nvim") })

require("auto-dark-mode").setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option_value("background", "dark", {})
		vim.cmd("colorscheme fluoromachine")
	end,
	set_light_mode = function()
		vim.api.nvim_set_option_value("background", "light", {})
		vim.cmd("colorscheme catppuccin-latte")
	end,
})
