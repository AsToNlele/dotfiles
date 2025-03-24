local wo = vim.wo
local opt = vim.opt
local g = vim.g
local o = vim.o
local api = vim.api

wo.relativenumber = true
wo.number = true
g.mapleader = " "
opt.termguicolors = true -- enable 24-bit RGB colors
opt.clipboard = "unnamedplus"
opt.undofile = true -- enable persistent undo
opt.laststatus = 2 -- single status line
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true
-- Highlight Yanked Text
api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- Delete all buffers expect current
api.nvim_create_user_command("BufCurOnly", "%bdelete|edit#|bdelete#", {})

o.tabstop = 4 -- A TAB character looks like 4 spaces
o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
o.shiftwidth = 4 -- Number of spaces inserted when indenting
