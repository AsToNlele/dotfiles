return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
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
	end,
}
