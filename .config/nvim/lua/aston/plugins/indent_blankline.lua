return {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		event = "BufReadPost",
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
