return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
			"nvim-neotest/neotest-python",
		},
		keys = {
			{ "<leader>t", "", desc = "+test" },
			{
				"<leader>tt",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run File",
			},
			{
				"<leader>tT",
				function()
					require("neotest").run.run(vim.uv.cwd())
				end,
				desc = "Run All Test Files",
			},
			{
				"<leader>tr",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Nearest",
			},
			{
				"<leader>tl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Run Last",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle Summary",
			},
			{
				"<leader>to",
				function()
					require("neotest").output.open({ enter = true, auto_close = true })
				end,
				desc = "Show Output",
			},
			{
				"<leader>tO",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Toggle Output Panel",
			},
			{
				"<leader>tS",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop",
			},
			{
				"<leader>tw",
				function()
					require("neotest").watch.toggle(vim.fn.expand("%"))
				end,
				desc = "Toggle Watch",
			},
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-golang"), -- Registration
					require("neotest-python")({
						is_test_file = function(file_path)
							local Path = require("plenary.path")
							if not vim.endswith(file_path, ".py") then
								return false
							end
							local elems = vim.split(file_path, Path.path.sep)
							local file_name = elems[#elems]
							return vim.startswith(file_name, "test") or vim.endswith(file_name, "test.py")
						end,
					}),
				},
			})
		end,
	},
}
