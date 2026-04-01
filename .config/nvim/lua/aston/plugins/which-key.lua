local pack = require("aston.pack")

vim.o.timeout = true
vim.o.timeoutlen = 300

pack.add({ pack.repo("folke/which-key.nvim") })

require("which-key").setup({})
