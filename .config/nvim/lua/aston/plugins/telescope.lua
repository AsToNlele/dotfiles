local pack = require("aston.pack")

pack.add({ pack.repo("folke/snacks.nvim") })

require("snacks").setup({
	picker = {
		enabled = true,
		ui_select = true,
		layout = {
			preset = function()
				return vim.o.columns >= 120 and "default" or "vertical"
			end,
		},
		formatters = {
			file = {
				filename_first = true,
			},
		},
	},
})

vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files({ cwd = vim.fn.getcwd() })
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fw", function()
	Snacks.picker.grep({ cwd = vim.fn.getcwd() })
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fh", function()
	Snacks.picker.help()
end, { desc = "Help tags" })

vim.keymap.set("n", "<leader>fr", function()
	Snacks.picker.resume()
end, { desc = "Resume picker" })
