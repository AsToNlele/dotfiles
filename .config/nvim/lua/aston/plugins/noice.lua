local pack = require("aston.pack")

pack.add({
	pack.repo("folke/noice.nvim"),
	pack.repo("MunifTanjim/nui.nvim"),
	pack.repo("rcarriga/nvim-notify"),
})

local notify = require("notify")
notify.setup({
	background_colour = "#000000",
	timeout = 3000,
})
vim.notify = notify

require("noice").setup({
	cmdline = {
		enabled = true,
		view = "cmdline_popup",
	},
	messages = {
		enabled = true,
		view = "mini",
		view_error = "notify",
		view_warn = "notify",
	},
	popupmenu = {
		enabled = true,
		backend = "nui",
	},
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = true,
	},
})
