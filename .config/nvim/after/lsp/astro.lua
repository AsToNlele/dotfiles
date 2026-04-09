return {
	cmd = { "astro-ls", "--stdio" },
	init_options = {
		typescript = {
			serverPath = vim.fs.normalize(
				"~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib/tsserverlibrary.js"
			),
		},
	},
}
