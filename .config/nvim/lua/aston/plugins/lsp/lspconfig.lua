local pack = require("aston.pack")
local lsp = require("aston.lsp")

pack.add({
	pack.repo("neovim/nvim-lspconfig"),
	pack.repo("antosha417/nvim-lsp-file-operations"),
})

require("lsp-file-operations").setup()
lsp.setup()

vim.lsp.enable({
	"html",
	"ts_ls",
	"cssls",
	"tailwindcss",
	"emmet_ls",
	"pyright",
	"texlab",
	"eslint",
	"lua_ls",
	"ruff",
	"astro",
	"intelephense",
	"clangd",
	"omnisharp",
})
