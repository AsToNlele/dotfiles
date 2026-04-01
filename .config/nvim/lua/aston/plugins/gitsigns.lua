local pack = require("aston.pack")

pack.add({ pack.repo("lewis6991/gitsigns.nvim") })

require("gitsigns").setup()
