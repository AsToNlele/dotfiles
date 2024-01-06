return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
	config = function()
		require('lualine').setup {
			options = {
				theme = 'dracula',
				section_separators = { '', '' },
				component_separators = { '', '' },
				icons_enabled = true,
				disabled_filetypes = { 'NVimTree' },
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch' },
				lualine_c = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hints = "󰛩 ",
						},
						color = {
							bg = "#525974",
						}
					},
					{ 'filename', path = 1 }
				},
				lualine_d = { { 'filename', path = 1 } },
				lualine_e = { {} },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
			inactive_sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch' },
				lualine_c = { 'filename' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
			tabline = {},
			extensions = {},
		}
	end,
}
