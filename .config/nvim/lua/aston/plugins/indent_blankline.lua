local pack = require("aston.pack")

pack.add({ pack.repo("lukas-reineke/indent-blankline.nvim") })

require("ibl").setup({
	indent = {
		char = "│",
		tab_char = "│",
	},
	exclude = {
		filetypes = {
			"help",
			"lazy",
			"mason",
			"notify",
			"oil",
		},
	},
})
