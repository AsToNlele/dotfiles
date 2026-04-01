local pack = require("aston.pack")

local toggle_files = function()
	if not MiniFiles.close() then
		local path = vim.api.nvim_buf_get_name(0)
		MiniFiles.open(path ~= "" and path or nil)
	end
end

pack.add({
	pack.repo("nvim-mini/mini.files", { version = vim.version.range("*") }),
})

require("mini.files").setup({
	options = {
		use_as_default_explorer = true,
	},
	windows = {
		preview = true,
		width_preview = 60,
	},
})

vim.keymap.set("n", "<leader>e", toggle_files, { desc = "Toggle file explorer" })
