return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
	{
		"saghen/blink.cmp",
		version = "*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				-- Show completion menu
				["<C-h>"] = {
					function(cmp)
						print("CTRL h")
						cmp.show()
					end,
				},
				-- ["<C-s>"] = {
				-- 	function(cmp)
				-- 		print("CTRL S")
				--
				-- 		cmp.show({ providers = { "snippets" } })
				-- 	end,
				-- },
				["<C-space>"] = {},
				["<Tab>"] = {},
			},
			cmdline = {
				enabled = false,
				completion = {
					menu = { auto_show = true },
				},
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				menu = {
					draw = {
						treesitter = { "lsp" },
					},
				},
			},
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "cmdline" },
			},
		},
		opts_extend = { "sources.default" },
	},
}
