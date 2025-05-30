return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			vim.filetype.add({ extension = { brief = "brief" } })

			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"go",
					"lua",
					"typescript",
					"javascript",
					"python",
					"json",
					"brief",
					"sql",
					"csv",
					"yaml",
					"xml",
				},
				auto_install = true,
				highlight = {
					enable = true,
				},
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.brief = {
				install_info = {
					url = "/Users/akartikov/work/vim/tree-sitter-brief", -- local path or git repo
					files = { "src/parser.c" },
				},
				filetype = "brief", -- if filetype does not match the parser name
			}

			vim.treesitter.language.register("brief", "brief")
		end,
	},
}
