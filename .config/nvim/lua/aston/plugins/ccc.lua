return {
	"uga-rosa/ccc.nvim",
	config = function()
		local ccc = require("ccc")

		ccc.setup({
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		})

		vim.keymap.set("n", "<leader>p", "<cmd>:CccPick<CR>")
	end,
}
