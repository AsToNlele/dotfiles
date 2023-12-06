vim.wo.relativenumber = true
vim.g.mapleader = " "
vim.opt.termguicolors = true -- enable 24-bit RGB colors
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true      -- enable persistent undo

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})
