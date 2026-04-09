local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}

	vim.lsp.buf.execute_command(params)
end

return {
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "non-relative",
			importModuleSpecifierEnding = "minimal",
		},
	},
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize imports",
		},
	},
	settings = {
		noErrorTruncation = true,
	},
}
