return {
	{
		"nvim-pack/nvim-spectre",
		lazy = true,
		cmd = { "Spectre" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
				desc = "Toggle Spectre",
			})
			require("spectre").setup({
				highlight = {
					search = "SpectreSearch",
					replace = "SpectreReplace",
				},
				mapping = {
					["send_to_qf"] = {
						map = "<C-q>",
						cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
						desc = "send all items to quickfix",
					},
				},
				replace_engine = {
					sed = {
						cmd = "sed",
						args = {
							"-i",
							"",
							"-E",
						},
					},
				},
			})
		end,
	},
}
