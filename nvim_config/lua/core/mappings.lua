-- Leader
vim.g.mapleader = " "

-- Insert
vim.keymap.set("i", "jj", "<Esc>")

-- Buffers
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- Navigation
-- тут команды, которые переключают окна в режиме :split и :vsplit
-- исходная команда: ctrl + W + (h,j,k,l)
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Change width split screen
vim.keymap.set("n", "<c->>", ":wincmd ><CR>")
vim.keymap.set("n", "<c-<>", ":wincmd <<CR>")

-- Splits
vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "\\", ":split<CR>")

-- Neotree
vim.keymap.set("n", "<leader>n", ":Neotree left reveal toggle<CR>")

-- Tabs
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<c-x>", ":BufferLineCloseOthers<CR>")

-- Show diagnostic (open LSP diagnostic in float window)
vim.keymap.set("n", "zd", vim.diagnostic.open_float)

-- Execute code in cur buffer
vim.keymap.set("n", "<F8>", function()
	file_path = vim.api.nvim_buf_get_name(0)
	if vim.endswith(file_path, ".py") then
		vim.cmd("w")
		require("toggleterm").exec("python " .. file_path)
	elseif vim.endswith(file_path, ".go") then
		vim.cmd("w")
		require("toggleterm").exec("go run " .. file_path)
	end
end)
