return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			cond = vim.fn.executable("cmake") == 1,
		},
	},
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set('n', '<leader>fr', ':Telescope resume<CR>', {}) -- fr no cap 🧢, Resume last telescope search
		-- Open file in new tab
		-- Ctrl + T
		--
		require("telescope").setup({
			defaults = {
				hidden = true,
			},
			pcall(require("telescope").load_extension, "fzf")
		})
	end,
}
