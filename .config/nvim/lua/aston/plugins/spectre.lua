local pack = require("aston.pack")

pack.add({
	pack.repo("nvim-pack/nvim-spectre"),
	pack.repo("nvim-lua/plenary.nvim"),
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

vim.keymap.set("n", "<leader>S", function()
	require("spectre").toggle()
end, { desc = "Toggle Spectre" })
