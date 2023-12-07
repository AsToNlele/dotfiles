return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_assume_mapped = true
		-- Alt Enter
		vim.keymap.set('i', '<M-CR>', 'copilot#Accept("<CR>")', {
			expr = true,
			replace_keycodes = false
		})
		vim.g.copilot_no_tab_map = true

	end,
}
