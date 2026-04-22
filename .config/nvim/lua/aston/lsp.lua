local M = {}

local signs = {
	Error = " ",
	Warn = " ",
	Hint = "󰠠 ",
	Info = " ",
}

local function map(bufnr, mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
end

function M.capabilities()
	local capabilities = require("blink.cmp").get_lsp_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

function M.on_attach(client, bufnr)
	if vim.lsp.inlay_hint and client:supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end

	map(bufnr, "n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map(bufnr, "n", "gd", vim.lsp.buf.definition, "Go to definition")
	map(bufnr, "n", "gi", vim.lsp.buf.implementation, "Go to implementation")
	map(bufnr, "n", "gt", vim.lsp.buf.type_definition, "Go to type definition")
	map(bufnr, "n", "gR", vim.lsp.buf.references, "Show references")
	map(bufnr, { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions")
	map(bufnr, "n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	map(bufnr, "n", "<leader>D", function()
		vim.diagnostic.setloclist({ open = true })
	end, "Buffer diagnostics")
	map(bufnr, "n", "<leader>d", vim.diagnostic.open_float, "Line diagnostics")
	map(bufnr, "n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, "Previous diagnostic")
	map(bufnr, "n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, "Next diagnostic")
	map(bufnr, "n", "<leader>rs", "<Cmd>LspRestart<CR>", "Restart LSP")
	map(bufnr, "n", "K", vim.lsp.buf.hover, "Hover documentation")
end

function M.setup()
	vim.diagnostic.config({
		severity_sort = true,
		float = { border = "rounded", source = "if_many" },
		underline = true,
		virtual_text = {
			spacing = 2,
			prefix = "●",
		},
	})

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("aston-lsp-attach", { clear = true }),
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client == nil then
				return
			end

			M.on_attach(client, args.buf)
		end,
	})

	vim.lsp.config("*", {
		capabilities = M.capabilities(),
	})
	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})
	vim.lsp.config("eslint", {
		settings = {
			format = false,
		},
	})
	vim.lsp.config("ruff", {
		init_options = {
			settings = {
				organizeImports = false,
			},
		},
	})
	vim.lsp.config("sourcekit_lsp", {
		cmd = { "xcrun", "sourcekit-lsp" },
		filetypes = { "swift", "objc", "objcpp" },
	})
end

return M
