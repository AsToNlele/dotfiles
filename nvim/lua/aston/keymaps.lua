function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

Map('n', '<leader>w', "<cmd>:w<CR>")
Map('n', '<leader>q', "<cmd>:qa!<CR>")

-- Switch between buffers
Map('n', '<S-l>', ":bnext <CR>")
Map('n', '<S-h>', ":bprevious <CR>")

-- Switch between panes
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")
Map("n", "<leader>x", "<cmd>:bdelete!<CR>")


Map("n", "<leader>gF", function()
	vim.lsp.buf.format({ timeout_ms = 2000 })
end
)
