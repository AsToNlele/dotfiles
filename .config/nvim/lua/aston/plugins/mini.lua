local pack = require("aston.pack")

pack.add({
	pack.repo("nvim-mini/mini.ai"),
	pack.repo("nvim-mini/mini.clue"),
	pack.repo("nvim-mini/mini.pairs"),
	pack.repo("nvim-mini/mini.surround"),
})

require("mini.ai").setup()
local clue = require("mini.clue")
clue.setup({
	clues = {
		clue.gen_clues.builtin_completion(),
		clue.gen_clues.g(),
		clue.gen_clues.marks(),
		clue.gen_clues.registers(),
		clue.gen_clues.square_brackets(),
		clue.gen_clues.windows({ submode_resize = true }),
		clue.gen_clues.z(),
		{ mode = "n", keys = "<Leader>b", desc = "+Buffer" },
		{ mode = "n", keys = "<Leader>f", desc = "+Find" },
		{ mode = "n", keys = "<Leader>g", desc = "+Git" },
		{ mode = "n", keys = "<Leader>h", desc = "+Harpoon" },
		{ mode = "n", keys = "<Leader>q", desc = "+Quit" },
		{ mode = "n", keys = "<Leader>s", desc = "+Session" },
		{ mode = "n", keys = "<Leader>w", desc = "+Write" },
		{ mode = "n", keys = "<Leader>c", desc = "+Crates/Code" },
	},
	triggers = {
		{ mode = "n", keys = "<Leader>" },
		{ mode = { "n", "x" }, keys = "g" },
		{ mode = { "n", "x" }, keys = "[" },
		{ mode = { "n", "x" }, keys = "]" },
		{ mode = { "n", "x" }, keys = "s" },
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },
		{ mode = "i", keys = "<C-x>" },
		{ mode = "n", keys = "<C-w>" },
		{ mode = { "n", "x" }, keys = "z" },
	},
})
require("mini.pairs").setup()
require("mini.surround").setup({
	search_method = "cover",
})
