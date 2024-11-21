return {
	-- "kylechui/nvim-surround",
	-- event = { "BufReadPre", "BufNewFile" },
	-- version = "*", -- Use for stability; omit to use `main` branch for the latest features
	-- config = true,
	"tpope/vim-surround"
}

-- Still like nvim-surround more
-- return {
-- 	"echasnovski/mini.nvim",
-- 	version = "*",
-- 	config = function()
-- 		require("mini.surround").setup()
-- 	end,
-- }
    -- Add surrounding with sa (in visual mode or on motion).
    -- Delete surrounding with sd.
    -- Replace surrounding with sr.
    -- Find surrounding with sf or sF (move cursor right or left).
    -- Highlight surrounding with sh.
    -- Change number of neighbor lines with sn (see |MiniSurround-algorithm|).
