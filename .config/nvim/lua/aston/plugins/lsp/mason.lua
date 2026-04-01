local pack = require("aston.pack")

pack.add({
	pack.repo("williamboman/mason.nvim"),
	pack.repo("williamboman/mason-lspconfig.nvim"),
	pack.repo("WhoIsSethDaniel/mason-tool-installer.nvim"),
})

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	automatic_installation = true,
})

mason_tool_installer.setup({})
