local wo = vim.wo
local opt = vim.opt
local g = vim.g
local o = vim.o
local api = vim.api
local is_windows = vim.fn.has("win32") == 1
local path_sep = is_windows and ";" or ":"
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_gzip = 1
g.loaded_tarPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_zipPlugin = 1
g.loaded_remote_plugins = 1

if not vim.env.PATH:find(mason_bin, 1, true) then
	vim.env.PATH = mason_bin .. path_sep .. vim.env.PATH
end

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

o.smartindent = true
o.tabstop = 4 -- A TAB character looks like 4 spaces
o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
o.shiftwidth = 4 -- Number of spaces inserted when indenting
o.cmdheight = 0
