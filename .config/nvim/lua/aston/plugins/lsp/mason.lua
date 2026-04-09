local pack = require("aston.pack")

pack.add({
	pack.repo("williamboman/mason.nvim"),
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
