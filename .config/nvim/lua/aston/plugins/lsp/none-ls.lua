local pack = require("aston.pack")

pack.add({
	pack.repo("nvimtools/none-ls.nvim"),
	pack.repo("nvim-lua/plenary.nvim"),
})

		local null_ls = require("null-ls")

		local null_ls_utils = require("null-ls.utils")

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		-- local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		--

		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					-- apply whatever logic you want (in this example, we'll only use null-ls)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
		end

		-- if you want to set up formatting on save, you can use this as a callback
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- add to your shared on_attach callback
		local on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						lsp_formatting(bufnr)
					end,
				})
			end
		end

		-- configure null_ls
	null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			-- setup formatters & linters
			sources = {
				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
				formatting.prettier.with({
					extra_filetypes = { "astro", "html" },
				}), -- js/ts formatter
				-- formatting.stylua, -- lua formatter
				-- formatting.isort,
				-- formatting.black,
				-- formatting.dart_format,
				-- formatting.djlint,
				-- formatting.blade_formatter,
				-- diagnostics.pylint,
				-- diagnostics.pyright,
				-- diagnostics.eslint_d
				-- .with({                 -- js/ts linter
				-- condition = function(utils)
				-- 	return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
				-- end,
				-- }),
				formatting.phpcsfixer,
			},
			on_attach,
			-- configure format on save

			-- on_attach = function(current_client, bufnr)
			-- 	if current_client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				vim.lsp.buf.format({
			-- 					filter = function(client)
			-- 						--  only use null-ls for formatting instead of lsp server
			-- 						return client.name == "null-ls"
			-- 					end,
			-- 					bufnr = bufnr,
			-- 				})
			-- 			end,
			-- 		})
			-- 	end
			-- end,
	})
