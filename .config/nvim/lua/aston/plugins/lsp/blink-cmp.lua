local pack = require("aston.pack")

pack.add({
	pack.repo("saghen/blink.compat", { version = vim.version.range("*") }),
	pack.repo("saghen/blink.cmp", { version = vim.version.range("*") }),
})

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-h>"] = {
			function(cmp)
				print("CTRL h")
				cmp.show()
			end,
		},
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
})
