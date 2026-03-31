return { {
	"tpope/vim-fugitive",
	cmd = { "G", "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gread" },
	keys = {
		{ "<leader>G", "<cmd>G<CR>", desc = "Git status" },
	},
}, {
	-- :GBrowse to open file in browser
	"tpope/vim-rhubarb",
	lazy = true,
} }
