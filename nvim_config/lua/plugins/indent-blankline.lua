-- https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/doc/indent_blankline.txt

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = "HiPhish/rainbow-delimiters.nvim",
		config = function()
			local highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			}

			vim.g.rainbow_delimeters = { highlight = highlight }

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

			require("ibl").setup({
				scope = { highlight = highlight },
				indent = {
					char = "┊",
				},
				exclude = {
					filetypes = {
						"lspinfo",
						"packer",
						"checkhealth",
						"help",
						"man",
						"gitcommit",
						"TelescopePrompt",
						"TelescopeResult",
						"dashboard",
					},
					buftypes = {
						"terminal",
						"nofile",
						"quickfix",
						"prompt",
						"dashboard",
					},
				},
			})
		end,
	},
}
