local pack = require("aston.pack")

pack.add({
	pack.repo("nvim-lua/plenary.nvim"),
	pack.repo("ThePrimeagen/harpoon", { version = "harpoon2" }),
	pack.repo("letieu/harpoon-lualine"),
})

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)

vim.keymap.set("n", "<leader>ho", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>hc", function()
	harpoon:list():clear()
end)

vim.keymap.set("n", "<leader>hr", function()
	harpoon:list():remove()
end)

for i, key in ipairs({ "<leader>1", "<leader>2", "<leader>3", "<leader>4", "<leader>5", "<leader>6", "<leader>7", "<leader>8", "<leader>9", "<leader>0" }) do
	vim.keymap.set("n", key, function()
		harpoon:list():select(i)
	end)
end
