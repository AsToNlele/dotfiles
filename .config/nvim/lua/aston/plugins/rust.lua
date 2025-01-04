return {
	{
		"rust-lang/rust.vim",
		enabled = false,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function()
			local keymap = vim.keymap -- for conciseness

			local opts = { noremap = true, silent = true }
			vim.g.rustaceanvim = {
				-- Plugin configuration
				tools = {},
				-- LSP configuration
				server = {
					on_attach = function(client, bufnr)
						-- if vim.lsp.inlay_hint then
						-- 	vim.lsp.inlay_hint.enable(true, { 0 })
						-- end
						opts.buffer = bufnr

						-- set keybinds
						opts.desc = "Show LSP references"
						keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

						opts.desc = "Go to declaration"
						keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

						opts.desc = "Show LSP definitions"
						keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

						opts.desc = "Show LSP implementations"
						keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

						opts.desc = "Show LSP type definitions"
						keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

						opts.desc = "See available code actions"
						keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

						opts.desc = "Smart rename"
						keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

						opts.desc = "Show buffer diagnostics"
						keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

						opts.desc = "Show line iagnostics"
						keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

						opts.desc = "Go to previous diagnostic"
						keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

						opts.desc = "Go to next diagnostic"
						keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

						opts.desc = "Show inline documentation for what is under cursor"
						keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

						opts.desc = "Restart LSP"
						keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
					end,

					default_settings = {
						-- rust-analyzer language server configuration
						["rust-analyzer"] = {
							check = {
								command = "clippy",
							},
							diagnostics = {
								enable = true,
								experimental = {
									enable = true,
								},
							},
							inlayHints = {
								enable = true,
								typeHints = true,
								parameterHints = true,
								chainingHints = false,
							},
						},
					},
				},
				-- DAP configuration
				dap = {},
			}
		end,
	},
}
