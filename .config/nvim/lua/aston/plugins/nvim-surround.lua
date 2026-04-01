local pack = require("aston.pack")

pack.add({ pack.repo("tpope/vim-surround") })

-- Replace html tag
-- cst<p>	- replaces whole tag with attributes
-- cst<p ENTER	- keeps attributes
