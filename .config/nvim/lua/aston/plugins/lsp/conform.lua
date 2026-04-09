local pack = require("aston.pack")

pack.add({ pack.repo("stevearc/conform.nvim") })

require("conform").setup({
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		timeout_ms = 2000,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		astro = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		php = { "php_cs_fixer" },
		scss = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		yaml = { "prettier" },
	},
})
