local pack = require("aston.pack")

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind
		if name ~= "nvim-treesitter" or (kind ~= "install" and kind ~= "update") then
			return
		end

		if not ev.data.active then
			vim.cmd.packadd("nvim-treesitter")
		end

		vim.cmd("TSUpdate")
	end,
})

pack.add({
	pack.repo("nvim-treesitter/nvim-treesitter"),
	pack.repo("windwp/nvim-ts-autotag"),
})

require("nvim-treesitter").setup({})
require("nvim-ts-autotag").setup({})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
