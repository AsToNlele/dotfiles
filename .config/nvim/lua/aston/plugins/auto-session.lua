local pack = require("aston.pack")

pack.add({ pack.repo("rmagatti/auto-session") })

local auto_session = require("auto-session")
auto_session.setup({
	auto_restore = true,
	auto_save = true,
	enabled = true,
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
