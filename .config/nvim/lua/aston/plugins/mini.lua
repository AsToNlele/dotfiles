local pack = require("aston.pack")

pack.add({
	pack.repo("echasnovski/mini.ai"),
	pack.repo("echasnovski/mini.pairs"),
})

require("mini.ai").setup()
require("mini.pairs").setup()
