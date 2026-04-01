local pack = require("aston.pack")

pack.add({
	pack.repo("tpope/vim-fugitive"),
	pack.repo("tpope/vim-rhubarb"),
})

vim.keymap.set("n", "<leader>G", function()
	vim.cmd("G")
end, { desc = "Git status" })
