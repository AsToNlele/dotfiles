return {
	{
		"saghen/blink.compat",
		-- use the latest release, via version = '*', if you also use the latest release for blink.cmp
		version = "*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},
	{

		"saghen/blink.cmp",
		-- enabled = false,
		-- optional: provides snippets for the snippet source
		dependencies = {
			-- add source
			{ "GustavEikaas/easy-dotnet.nvim" },
			-- {
			-- 	"L3MON4D3/LuaSnip",
			-- 	version = "v2.*",
			-- },
			-- "rafamadriz/friendly-snippets",
		},

		-- use a release tag to download pre-built binaries
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- snippets = { preset = "luasnip" },
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = {
				preset = "default",
				-- Show completion menu
				["<C-h>"] = {
					function(cmp)
						print("CTRL h")
						cmp.show()
					end,
				},
				["<C-s>"] = {
					function(cmp)
						print("CTRL S")

						cmp.show({ providers = { "snippets" } })
					end,
				},
				["<C-space>"] = {},
				["<Tab>"] = {},
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			completion = {
				accept = {
					-- experimental auto-brackets support
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

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "easydotnet", "omni" },
				providers = {
					easydotnet = {
						name = "easy-dotnet",
						module = "blink.compat.source",
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
