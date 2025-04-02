return {
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
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			local function show_documentation()
				local filetype = vim.bo.filetype
				if filetype == "vim" or filetype == "help" then
					vim.cmd("h " .. vim.fn.expand("<cword>"))
				elseif filetype == "man" then
					vim.cmd("Man " .. vim.fn.expand("<cword>"))
				elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
					require("crates").show_popup()
				else
					vim.lsp.buf.hover()
				end
			end

			vim.keymap.set("n", "K", show_documentation, { silent = true })
			local crates = require("crates")
			local opts = { silent = true }

			vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
			vim.keymap.set("n", "<leader>cr", crates.reload, opts)

			vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
			vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
			vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)

			vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
			vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
			vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
			vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
			vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
			vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opts)

			vim.keymap.set("n", "<leader>cx", crates.expand_plain_crate_to_inline_table, opts)
			vim.keymap.set("n", "<leader>cX", crates.extract_crate_into_table, opts)

			vim.keymap.set("n", "<leader>cH", crates.open_homepage, opts)
			vim.keymap.set("n", "<leader>cR", crates.open_repository, opts)
			vim.keymap.set("n", "<leader>cD", crates.open_documentation, opts)
			vim.keymap.set("n", "<leader>cC", crates.open_crates_io, opts)
			vim.keymap.set("n", "<leader>cL", crates.open_lib_rs, opts)

			crates.setup();

		end,
	},
}
