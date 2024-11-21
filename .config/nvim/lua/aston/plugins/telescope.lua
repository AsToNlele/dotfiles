return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
				cond = vim.fn.executable("cmake") == 1,
			},
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fr", ":Telescope resume<CR>", {}) -- fr no cap 🧢, Resume last telescope search
			-- Open file in new tab
			-- Ctrl + T
			--
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
						no_ignore=true
					},
				},
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"yarn.lock",
						".git",
						".sl",
						"_build",
						".next",
					},
					hidden = true,
					path_display = {
						"filename_first",
					},
					layout_strategy = "vertical",
					layout_config = { height = 0.95 },
				},
				pcall(require("telescope").load_extension, "fzf"),
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
