local pack = require("aston.pack")

pack.add({
	pack.repo("numToStr/Comment.nvim"),
	pack.repo("JoosepAlviste/nvim-ts-context-commentstring"),
})

local comment = require("Comment")
local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

comment.setup({
	pre_hook = ts_context_commentstring.create_pre_hook(),
})
-- Not good enough yet eg for Dart
-- -- Correct commenting for React, Vue, etc
-- return {
-- 	"JoosepAlviste/nvim-ts-context-commentstring",
-- 	config = function()
-- 		require("ts_context_commentstring").setup({
-- 			enable_autocmd = false,
-- 		})
--
-- 		-- Override native commenting 
-- 		local get_option = vim.filetype.get_option
-- 		vim.filetype.get_option = function(filetype, option)
-- 			return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
-- 				or get_option(filetype, option)
-- 		end
-- 	end,
-- }
