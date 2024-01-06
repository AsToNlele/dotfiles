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


