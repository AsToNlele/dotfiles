return {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		event = "BufEnter",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			-- scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"lazy",
					"mason",
					"notify",
					"oil",
				},
			},
		},
		main = "ibl",
	},
}
