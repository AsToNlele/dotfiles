function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

Map("n", "<leader>w", "<cmd>:w<CR>")
Map("n", "<leader>qq", "<cmd>:q!<CR>")
Map("n", "<leader>qa", "<cmd>:qa!<CR>")

-- Switch between buffers
Map("n", "<S-l>", "<cmd>:BufferLineCycleNext <CR>")
Map("n", "<S-h>", "<cmd>:BufferLineCyclePrev <CR>")

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

-- Select last selection
-- gv

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
end)

Map("n", "<leader>gE", "<cmd>:EslintFixAll<CR>")

-- Move buffers
Map("n", "<leader>l", "<cmd>:BufferLineMoveNext<CR>")
Map("n", "<leader>h", "<cmd>:BufferLineMovePrev<CR>")

-- nmap <buffer> gD :tab LspDefinition<CR>

-- Map Esc to :nohl
Map("n", "<Esc>", "<cmd>nohl<CR>")

-- Centered scrolling
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")

Map("n", "<leader>G", "<cmd>:G<CR>")

-- nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<CR> 
vim.keymap.set({"n", "v"}, 'ga', function()
    vim.lsp.buf.code_action() end, bufopts)

-- local function nnoremap(keymap, cmd)
-- 	Map("n", keymap, cmd)
-- end
--
-- local harpoon_ui = require("harpoon.ui")
-- local harpoon_mark = require("harpoon.mark")
-- -- Harpoon keybinds --
-- -- Open harpoon ui
-- nnoremap("<leader>ho", function()
-- 	harpoon_ui.toggle_quick_menu()
-- end)
--
-- -- Add current file to harpoon
-- nnoremap("<leader>ha", function()
-- 	harpoon_mark.add_file()
-- end)
--
-- -- Remove current file from harpoon
-- nnoremap("<leader>hr", function()
-- 	harpoon_mark.rm_file()
-- end)
--
-- -- Remove all files from harpoon
-- nnoremap("<leader>hc", function()
-- 	harpoon_mark.clear_all()
-- end)
--
-- -- Quickly jump to harpooned files
-- nnoremap("<leader>1", function()
-- 	harpoon_ui.nav_file(1)
-- end)
--
-- nnoremap("<leader>2", function()
-- 	harpoon_ui.nav_file(2)
-- end)
--
-- nnoremap("<leader>3", function()
-- 	harpoon_ui.nav_file(3)
-- end)
--
-- nnoremap("<leader>4", function()
-- 	harpoon_ui.nav_file(4)
-- end)
--
-- nnoremap("<leader>5", function()
-- 	harpoon_ui.nav_file(5)
-- end)
