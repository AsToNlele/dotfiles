return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
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
		},
		keys = {
			{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
			{ "<leader>fw", function() Snacks.picker.grep() end, desc = "Live grep" },
			{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
			{ "<leader>fh", function() Snacks.picker.help() end, desc = "Help tags" },
			{ "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume picker" },
		},
	},
}
