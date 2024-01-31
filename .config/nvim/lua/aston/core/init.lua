vim.wo.relativenumber = true
vim.wo.number = true
vim.g.mapleader = " "
vim.opt.termguicolors = true -- enable 24-bit RGB colors
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true      -- enable persistent undo
vim.opt.laststatus = 2 -- single status line
-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- Delete all buffers expect current
vim.api.nvim_create_user_command("BufCurOnly", '%bdelete|edit#|bdelete#' , {})

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
