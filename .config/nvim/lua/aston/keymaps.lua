function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

Map('n', '<leader>w', "<cmd>:w<CR>")
Map('n', '<leader>qq', "<cmd>:q!<CR>")
Map('n', '<leader>qa', "<cmd>:qa!<CR>")

-- Switch between buffers
Map('n', '<S-l>', ":bnext <CR>")
Map('n', '<S-h>', ":bprevious <CR>")

-- Not using Tabs anymore
-- 
-- Go to definition on new tab
-- Map("n", "<leader>gD", "<cmd>tab split | lua vim.lsp.buf.definition()<cr>")
-- Switch between tabs 
-- Map('n', '<S-l>', ":tabnext <CR>")
-- Map('n', '<S-h>', ":tabprevious <CR>")

-- Move current split to a new tab
-- Default
-- Ctrl + W + Shift + T
-- New
-- Leader + T
-- Map('n', '<leader>t', "<C-w>T")

-- Delete between tags
-- dit

-- Switch between panes
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")
Map("n", "<leader>bx", "<cmd>:bdelete!<CR>")
Map("n", "<leader>bq", "<cmd>:bdelete!<CR>")
Map("n", "<leader>be", "<cmd>:BufCurOnly<CR>")
Map("n", "<leader>ba", "<cmd>::%bd<CR>")

Map("n", "<leader>gF", function()
	vim.lsp.buf.format({ timeout_ms = 2000 })
end
)

-- nmap <buffer> gD :tab LspDefinition<CR>

-- Map Esc to :nohl
Map("n", "<Esc>", "<cmd>nohl<CR>")
