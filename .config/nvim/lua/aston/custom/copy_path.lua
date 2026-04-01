-- credit: dmmulroy

vim.api.nvim_create_user_command("CopyFilePathToClipboard", function()
	local file_path = vim.fs.normalize(vim.api.nvim_buf_get_name(0))
	local current_dir = vim.fs.normalize(vim.fn.getcwd())
	local prefix = current_dir .. "/"
	local relative_path = file_path

	if file_path:sub(1, #prefix) == prefix then
		relative_path = file_path:sub(#prefix + 1)
	end

	vim.fn.setreg("+", relative_path)
end, {})

vim.api.nvim_create_user_command("CFP", function()
	vim.cmd(":CopyFilePathToClipboard")
end, {})
