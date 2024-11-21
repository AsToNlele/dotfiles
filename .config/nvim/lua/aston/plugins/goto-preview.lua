return {
	"rmagatti/goto-preview",
	event = "BufEnter",
	keys = {
		{
			"pd",
			"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
			noremap = true,
			desc = "goto preview definition",
		},
	},
	config = function()
		require("goto-preview").setup({
			width = 120, -- Width of the floating window
			height = 15, -- Height of the floating window
		})
	end,
}
