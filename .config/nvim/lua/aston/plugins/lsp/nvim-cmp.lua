return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		-- "rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		-- require("luasnip.loaders.from_vscode").lazy_load()
		-- require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/nvim/lua/aston/plugins/lsp/my-snippets/" } })

		cmp.setup({
			-- performance = {
			-- 	max_view_entries = ,
			-- },
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			-- sources for autocompletion
			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					-- entry_filter = function(entry, ctx)
					-- 	-- Disable LSP snippets
					-- 	-- return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
					-- end,
				},
				-- { name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},

			mapping = {
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<CR>"] = cmp.mapping.confirm(),
				["<M-i>"] = cmp.mapping.complete(),
			},
		})
	end,
}

-- NO LSP Snippet support :(
-- return {
-- 	"echasnovski/mini.completion",
-- 	version = "*",
-- 	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
-- 	config = function()
-- 		require("mini.completion").setup({
-- 			mappings = {
-- 				force_twostep = "<M-i>", -- Force two-step completion
-- 			},
-- 		})
-- 		local imap_expr = function(lhs, rhs)
-- 			vim.keymap.set("i", lhs, rhs, { expr = true })
-- 		end
-- 		imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
-- 		imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
-- 		local keycode = vim.keycode or function(x)
-- 			return vim.api.nvim_replace_termcodes(x, true, true, true)
-- 		end
-- 		local keys = {
-- 			["cr"] = keycode("<CR>"),
-- 			["ctrl-y"] = keycode("<C-y>"),
-- 			["ctrl-y_cr"] = keycode("<C-y><CR>"),
-- 		}
--
-- 		_G.cr_action = function()
-- 			if vim.fn.pumvisible() ~= 0 then
-- 				-- If popup is visible, confirm selected item or add new line otherwise
-- 				local item_selected = vim.fn.complete_info()["selected"] ~= -1
-- 				return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
-- 			else
-- 				-- If popup is not visible, use plain `<CR>`. You might want to customize
-- 				-- according to other plugins. For example, to use 'mini.pairs', replace
-- 				-- next line with `return require('mini.pairs').cr()`
-- 				return keys["cr"]
-- 			end
-- 		end
--
-- 		vim.keymap.set("i", "<CR>", "v:lua._G.cr_action()", { expr = true })
-- 	end,
-- }
